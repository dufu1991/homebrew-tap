import copy
import hashlib
import importlib.util
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch


SPEC = importlib.util.spec_from_file_location(
    "sync_foldgit", Path(__file__).resolve().parents[1] / "Scripts/sync_foldgit.py"
)
sync = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(sync)


class ReleaseTests(unittest.TestCase):
    def setUp(self):
        self.package = b"FoldGit release fixture"
        self.checksum = hashlib.sha256(self.package).hexdigest()
        self.release = {
            "tag_name": "v0.1.0", "draft": False, "prerelease": False,
            "assets": [{
                "name": sync.ASSET_NAME, "state": "uploaded",
                "size": len(self.package), "digest": f"sha256:{self.checksum}",
                "browser_download_url": (
                    f"https://github.com/{sync.REPOSITORY}/releases/download/"
                    f"v0.1.0/{sync.ASSET_NAME}"
                ),
            }],
        }

    def test_rejects_unstable_or_invalid_tags(self):
        for changes in (
            {"draft": True}, {"prerelease": True}, {"tag_name": "v1.0.0-beta.1"},
            {"tag_name": "v01.0.0"}, {"tag_name": 'v1.0.0"; system("id")'},
        ):
            with self.subTest(changes=changes), self.assertRaises(ValueError):
                sync.release_package(self.release | changes)

    def test_requires_one_complete_asset_with_digest_and_expected_url(self):
        for changes in (
            {"state": "new"}, {"size": 0}, {"digest": "sha256:invalid"},
            {"browser_download_url": "https://example.com/FoldGit.dmg"},
        ):
            release = copy.deepcopy(self.release)
            release["assets"][0].update(changes)
            with self.subTest(changes=changes), self.assertRaises(ValueError):
                sync.release_package(release)
        for assets in ([], self.release["assets"] * 2):
            with self.subTest(assets=assets), self.assertRaises(ValueError):
                sync.release_package(self.release | {"assets": assets})

    def test_verifies_size_and_checksum(self):
        with tempfile.TemporaryDirectory() as directory:
            package = Path(directory) / sync.ASSET_NAME
            package.write_bytes(self.package)
            asset = self.release["assets"][0]
            self.assertEqual(sync.verify_package(package, asset), self.checksum)
            with self.assertRaises(ValueError):
                sync.verify_package(package, asset | {"size": asset["size"] + 1})
            package.write_bytes(b"x" * len(self.package))
            with self.assertRaises(ValueError):
                sync.verify_package(package, asset)

    def test_update_is_idempotent_and_supports_rebuilt_assets(self):
        def download(command, **kwargs):
            (Path(command[-1]) / sync.ASSET_NAME).write_bytes(self.package)

        with tempfile.TemporaryDirectory() as directory, patch.object(
            sync.subprocess, "run", side_effect=download
        ):
            destination = Path(directory) / "foldgit.rb"
            self.assertTrue(sync.update_cask(self.release, destination))
            self.assertFalse(sync.update_cask(self.release, destination))
            self.package = b"Rebuilt release fixture"
            checksum = hashlib.sha256(self.package).hexdigest()
            self.release["assets"][0].update(
                size=len(self.package), digest=f"sha256:{checksum}"
            )
            self.assertTrue(sync.update_cask(self.release, destination))
            self.assertIn(checksum, destination.read_text())

    def test_invalid_download_does_not_replace_existing_cask(self):
        def download(command, **kwargs):
            (Path(command[-1]) / sync.ASSET_NAME).write_bytes(b"invalid")

        with tempfile.TemporaryDirectory() as directory, patch.object(
            sync.subprocess, "run", side_effect=download
        ):
            destination = Path(directory) / "foldgit.rb"
            destination.write_text("existing cask")
            with self.assertRaises(ValueError):
                sync.update_cask(self.release, destination)
            self.assertEqual(destination.read_text(), "existing cask")


if __name__ == "__main__":
    unittest.main()
