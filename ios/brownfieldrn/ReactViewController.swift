//
//  ReactViewController.swift
//  brownfieldrn
//
//  Created by Frank Calise on 8/8/23.
//
import UIKit
import React

@objc public class ReactViewController: UIViewController {
    
    @objc init(moduleName: String, bridge: RCTBridge, initialProperties: [AnyHashable: Any]?) {
        super.init(nibName: nil, bundle: nil)
        view = RCTRootView(bridge: bridge,
                           moduleName: moduleName,
                           initialProperties: initialProperties)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
