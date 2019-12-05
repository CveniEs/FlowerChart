//
//  FlutterLog.swift
//  Runner
//
//  Created by cvenies on 2019/11/27.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import Foundation
import Flutter

class FlutterLog {
    static func flutterLog(call: FlutterMethodCall, resutl: FlutterResult) {

        if let argument = call.arguments as? [String: String] {
            let tag = argument["tag"]
            let message = argument["message"];
            print("\(tag ?? ""): \(message ?? "")")
        }
    }
}
