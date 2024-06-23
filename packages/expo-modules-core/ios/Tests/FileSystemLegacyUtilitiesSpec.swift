// Copyright 2015-present 650 Industries. All rights reserved.

import ExpoModulesTestCore

@testable import ExpoModulesCore

final class FileSystemLegacyUtilitiesSpec: ExpoSpec {
  override class func spec() {
    let fsUtils = FileSystemLegacyUtilities()

    describe("getPathPermissions") {
      it("should return read/write permissions for filePath with `file:` scheme") {
        let docRootUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = docRootUrl.appendingPathComponent("test.txt")
        let filePath = fileUrl.absoluteString
        expect(filePath.starts(with: "file:")) == true
        expect(fsUtils.getPathPermissions(filePath)) == [.read, .write]
      }

      it("should return read/write permissions for filePath without `file:` scheme") {
        let docRootUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = docRootUrl.appendingPathComponent("test.txt")
        let filePath = fileUrl.path
        expect(filePath.starts(with: "file:")) == false
        expect(fsUtils.getPathPermissions(filePath)) == [.read, .write]
      }
    }
  }
}
