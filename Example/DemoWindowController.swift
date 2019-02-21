//
//  DemoWindowController.swift
//  Example-macOS
//
//  Created by BB9z on 2019/2/21.
//  Copyright © 2019 RFUI. All rights reserved.
//

class DemoWindowController: NSWindowController {
    var navigationController: RFNavigationController {
        return contentViewController as! RFNavigationController
    }
    
    @IBAction func navigationPop(_ sender: Any) {
        navigationController.popViewController(animated: true)
    }
    
    @IBAction func pushA(_ sender: Any) {
        pushVC(identifier: "vcA")
    }
    @IBAction func pushB(_ sender: Any) {
        pushVC(identifier: "vcB")
    }
    @IBAction func pushC(_ sender: Any) {
        pushVC(identifier: "vcC")
    }
    @IBAction func pushD(_ sender: Any) {
        pushVC(identifier: "vcD")
    }
    
    func pushVC(identifier: String) {
        guard let vc = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: identifier) as? NSViewController else {
            fatalError()
        }
        navigationController.pushViewController(vc, animated: true)
    }
}
