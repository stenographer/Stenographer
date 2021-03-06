// Entries.swift
//
// Copyright (c) 2018 Stenographer
//
// Copyright (c) 2015 - 2016 Justin Pawela & The LogKit Project
// http://www.logkit.info/
//
// Permission to use, copy, modify, and/or distribute this software for any
// purpose with or without fee is hereby granted, provided that the above
// copyright notice and this permission notice appear in all copies.
//
// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
// ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
// OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

import Foundation

/**
 *  The details of a Log Entry.
 *
 *  - Parameters:
 *      - stenographerVersion: The version of the Stenographer framework that generated this Entry.
 *      - message: The message provided during the logging call.
 *      - userInfo: A set of additional values to be provided to each Endpoint's `entryFormatter`.
 *      - level: The name of the Entry's Priority Level.
 *      - timestamp: The number of seconds since the Unix epoch (midnight 1970-01-01 UTC).
 *      - dateTime: The Entry's timestamp as a string serialized by an Endpoint's `dateFormatter`.
 *      - functionName: The function from which the Log Entry was created.
 *      - fileName: The name of the source file from which the Log Entry was created.
 *      - filePath: The absolute path of the source file from which the Log Entry was created.
 *      - lineNumber: The line number in the file from which the Log Entry was created.
 *      - columnNumber: The column number in the file from which the Log Entry was created.
 *      - threadID: The ID of the thread from which the Log Entry was created.
 *      - threadName: The name of the thread from which the Log Entry was created.
 *      - isMainThread: An indicator of whether the Log Entry was created on the main thread.
 *      - osVersionString: A description of the operating system, including its name and version.
 *      - osMajorVersion: The major version number of the operating system.
 *      - osMinorVersion: The minor version number of the operating system.
 *      - osPatchVersion: The patch version number of the operating system.
 *      - osBuildVersion: The build version string of the operating system.
 *      - bundleID: The bundle ID of the host application.
 *      - deviceModel: The model of the device running the application.
 *      - deviceType: The type of the device running the application.
 *      - deviceVendorID: The vendor ID of the device running the application (if available).
 *      - deviceAdvertisingID: The advertising ID of the device running the application (if available).
 */
public struct SXLogEntry {

    /// The version of the Stenographer framework that generated this Entry.
    public let stenographerVersion: String = SX_STENOGRAPHER_VERSION
    /// The message provided during the logging call.
    public let message: String
    /// A dictionary of additional values to be provided to each Endpoint's `entryFormatter`.
    public let userInfo: [String: AnyObject]
    /// The name of the Entry's Priority Level.
    public let level: String
    /// The number of seconds since the Unix epoch (midnight 1970-01-01 UTC).
    public let timestamp: Double
    /// The Entry's timestamp as a string serialized by an Endpoint's `dateFormatter`.
    public let dateTime: String
    /// The function from which the Log Entry was created.
    public let functionName: String
    /// The absolute path of the source file from which the Log Entry was created.
    public let filePath: String
    /// The line number in the file from which the Log Entry was created.
    public let lineNumber: Int
    /// The column number in the file from which the Log Entry was created.
    public let columnNumber: Int
    /// The ID of the thread from which the Log Entry was created.
    public let threadID: String
    /// The name of the thread from which the Log Entry was created.
    public let threadName: String
    /// An indicator of whether the Log Entry was created on the main thread.
    public let isMainThread: Bool
    /// A description of the operating system, including its name and version.
    public let osVersionString: String = SX_DEVICE_OS.description
    /// The major version number of the operating system.
    public let osMajorVersion: Int = SX_DEVICE_OS.majorVersion
    /// The minor version number of the operating system.
    public let osMinorVersion: Int = SX_DEVICE_OS.minorVersion
    /// The patch version number of the operating system.
    public let osPatchVersion: Int = SX_DEVICE_OS.patchVersion
    /// The build version string of the operating system.
    public let osBuildVersion: String = SX_DEVICE_OS.buildVersion
    /// The bundle ID of the host application.
    public let bundleID: String = SX_BUNDLE_ID
    /// The model of the device running the application.
    public let deviceModel: String = SX_DEVICE_MODEL
    /// The type of the device running the application.
    public let deviceType: String = SX_DEVICE_TYPE
    /// The vendor ID of the device running the application (if available).
    public let deviceVendorID: String = SX_DEVICE_IDS.vendor
    /// The advertising ID of the device running the application (if available).
    public let deviceAdvertisingID: String = SX_DEVICE_IDS.advertising

    /// The name of the source file from which the Log Entry was created.
    public var fileName: String { return (self.filePath as NSString).lastPathComponent }
}

/// Private extension to facilitate JSON serialization.
internal extension SXLogEntry {

    /// Returns the Log Entry as a dictionary.
    func asMap() -> [String: Any] {
        return [
            "stenographerVersion": self.stenographerVersion,
            "message": self.message,
            "userInfo": self.userInfo,
            "level": self.level,
            "timestamp": self.timestamp,
            "dateTime": self.dateTime,
            "functionName": self.functionName,
            "fileName": self.fileName,
            "filePath": self.filePath,
            "lineNumber": self.lineNumber,
            "columnNumber": self.columnNumber,
            "threadID": self.threadID,
            "threadName": self.threadName,
            "isMainThread": self.isMainThread,
            "osVersionString": self.osVersionString,
            "osMajorVersion": self.osMajorVersion,
            "osMinorVersion": self.osMinorVersion,
            "osPatchVersion": self.osPatchVersion,
            "osBuildVersion": self.osBuildVersion,
            "bundleID": self.bundleID,
            "deviceModel": self.deviceModel,
            "deviceType": self.deviceType,
            "deviceVendorID": self.deviceVendorID,
            "deviceAdvertisingID": self.deviceAdvertisingID,
        ]
    }
}
