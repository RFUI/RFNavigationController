//
//  DebugViewController.swift
//  Example-macOS
//
//  Created by BB9z on 2019/2/21.
//  Copyright © 2019 RFUI. All rights reserved.
//

/**
 
 */
class DebugViewController: NSViewController {
    override var debugDescription: String {
        return "<\(className) - \(title ?? "")>"
    }
}
