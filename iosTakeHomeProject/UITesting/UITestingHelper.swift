//
//  UITestingHelper.swift
//  iosTakeHomeProject
//
//  Created by Khawla Zarrami on 18/11/2025.
//

#if DEBUG

import Foundation

struct UITestingHelper {
    
    static var isUITesting: Bool {
        ProcessInfo.processInfo.arguments.contains("-ui-testing")
    }
    
    static var isNetworkingSuccessful: Bool {
        ProcessInfo.processInfo.environment["-networking-success"] == "1"
    }
    
    
}

#endif
