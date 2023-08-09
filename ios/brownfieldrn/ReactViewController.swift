//
//  ReactViewController.swift
//  brownfieldrn
//
//  Created by Frank Calise on 8/8/23.
//
import UIKit
import React
//import AppDelegate

@objc public class ReactViewController: UIViewController {
    // Switching to AppDelegate as bridge delegate makes no difference
    // private static let reactNativeBridgeDelegate = UIApplication.shared.delegate as! AppDelegate
    private static let reactNativeBridgeDelegate = RNBridgeDelegate()
    private static var bridgeInitializeationTask: Task<RCTBridge?, Never>?
    
    @objc public static func initializeBridge() {
        Self.bridgeInitializeationTask = Task {
            let bridge = RCTBridge(delegate: reactNativeBridgeDelegate)
            return bridge
        }
    }
    
    let moduleName: String
    let initialProperties: [AnyHashable: Any]?
    
    // @objc init(moduleName: String, bridge: RCTBridge, initialProperties: [AnyHashable: Any]?) {
    //     super.init(nibName: nil, bundle: nil)
    //     view = RCTRootView(bridge: bridge,
    //                        moduleName: moduleName,
    //                        initialProperties: initialProperties)
    // }
    
    @objc init(moduleName: String, initialProperties: [AnyHashable: Any]?) {
        self.moduleName = moduleName
        self.initialProperties = initialProperties
        super.init(nibName: nil, bundle: nil)
        // let bridge = RCTBridge(delegate: RNBridgeDelegate(), launchOptions: nil)
        // super.init(nibName: nil, bundle: nil)
        // view = RCTRootView(bridge: bridge,
        //                    moduleName: moduleName,
        //                    initialProperties: initialProperties)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad () {
        super.viewDidLoad()
        
        guard let bridgeInitializeationTask = Self.bridgeInitializeationTask else {
            fatalError("ReactViewController.initializeBridge() must be called before ReactViewController is initialized")
        }
        
        Task { @MainActor in
            guard let bridge = await bridgeInitializeationTask.value else {
                fatalError("Failed to initialize React Native bridge")
            }
            
            self.view = RCTRootView(bridge: bridge,
                                       moduleName: self.moduleName,
                                       initialProperties: self.initialProperties)
        }
    }
}

private class RNBridgeDelegate: NSObject, RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL? {
        guard let codeLocation = Bundle(for: type(of: self)).url(forResource: "main", withExtension: "jsbundle") else {
            let bundleURLProvider = RCTBundleURLProvider.sharedSettings()
            let jsBundleURL = bundleURLProvider?.jsBundleURL(forBundleRoot: "index")
            return jsBundleURL
        }
        
        return codeLocation
    }
}
