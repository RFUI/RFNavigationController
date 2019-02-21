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
    
    override func viewWillAppear() {
        super.viewWillAppear()
        print("Appearing \(debugDescription)")
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        print("Appeared \(debugDescription)")
    }
    
    override func viewWillDisappear() {
        super.viewWillDisappear()
        print("Disappearing \(debugDescription)")
    }
    override func viewDidDisappear() {
        super.viewDidDisappear()
        print("Disappeared \(debugDescription)")
    }
}
