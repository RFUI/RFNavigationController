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
    
    // MARK: - Pop
    @IBAction func navigationPop(_ sender: Any) {
        navigationController.popViewController(animated: true)
    }
    
    // MARK: - Push
    @IBAction func pushA(_ sender: Any) {
        let vc = demoVC(identifier: "vcA")
        navigationController.pushViewController(vc, animated: true)
    }
    @IBAction func pushB(_ sender: Any) {
        let vc = demoVC(identifier: "vcB")
        navigationController.pushViewController(vc, animated: true)
    }
    @IBAction func pushC(_ sender: Any) {
        let vc = demoVC(identifier: "vcC")
        navigationController.pushViewController(vc, animated: true)
    }
    @IBAction func pushD(_ sender: Any) {
        let vc = demoVC(identifier: "vcD")
        navigationController.pushViewController(vc, animated: true)
    }
    
    // MARK: - Setting
    @IBAction func onSettingVCs(_ sender: NSPopUpButton) {
        guard let token = sender.selectedItem?.title else { return }
        let vcs: [NSViewController] = token.split(separator: ",").compactMap { id -> NSViewController? in
            return staticVCMap[String(id)]
        }
        navigationController.setViewControllers(vcs, animated: true)
        print(navigationController.viewControllers.debugDescription)
    }
    private lazy var staticVCMap: [String: NSViewController] = {
        return [
            "A": demoVC(identifier: "vcA"),
            "B": demoVC(identifier: "vcB"),
            "C": demoVC(identifier: "vcC"),
            "D": demoVC(identifier: "vcD"),
                ]
    }()
    
    // MARK: -
    private func demoVC(identifier: String) -> NSViewController {
        return NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: identifier) as! NSViewController
    }
}
