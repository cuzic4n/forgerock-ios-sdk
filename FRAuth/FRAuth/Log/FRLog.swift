// 
//  FRLog.swift
//  FRAuth
//
//  Copyright (c) 2020 ForgeRock. All rights reserved.
//
//  This software may be modified and distributed under the terms
//  of the MIT license. See the LICENSE file for details.
//


import Foundation
import FRCore

/**
FRLog is a class responsible for Logging functionalities of FRAuth SDK. FRLog can also be used in the application layer which then be displayed through FRAuth SDK, and through OSLog with FRAuth SDK's system label and LogLevel.

## Note ##
By default, FRLog uses OSLog to display the log entry in the debug console, and in the log system of iOS; however, when *OS_ACTIVITY_MODE* is *disabled* in the environment variable, FRLog then uses default system *print()* method to display the log entry in the console only.
*/
@objc public class FRLog: NSObject {
    
    /// Module name of FRLog
    static var ModuleName: String {
        get {
            var versionStr = ""
            if let version = Bundle(for: FRAuth.self).infoDictionary?["CFBundleShortVersionString"] as? String {
                versionStr = "[\(version)]"
            }
            return "[FRAuth]" + versionStr
        }
    }
    
    //  MARK: - Method
    
    /// Sets LogLevel
    ///
    /// - Parameter logLevel: Designated LogLevel to be displayed
    @objc public static func setLogLevel(_ logLevel: LogLevel) {
        Log.setLogLevel(logLevel)
    }
    
    public static func v(_ message: String, _ includeCallStack: Bool? = true, file: String = #file, line: Int = #line, function: String = #function) {
        Log.v(message, includeCallStack, module: ModuleName, file: file, line: line, function: function)
    }
    
    public static func i(_ message: String, _ includeCallStack: Bool? = true, file: String = #file, line: Int = #line, function: String = #function) {
        Log.i(message, includeCallStack, module: ModuleName, file: file, line: line, function: function)
    }
    
    
    public static func w(_ message: String, _ includeCallStack: Bool? = true, file: String = #file, line: Int = #line, function: String = #function) {
        Log.w(message, includeCallStack, module: ModuleName, file: file, line: line, function: function)
    }
    
    public static func e(_ message: String, file: String = #file, line: Int = #line, function: String = #function) {
        Log.e(message, module: ModuleName, file: file, line: line, function: function)
    }
}
