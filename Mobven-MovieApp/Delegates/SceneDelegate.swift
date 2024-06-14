//
//  SceneDelegate.swift
//  Mobven-MovieApp
//
//  Created by Elif Tum on 9.06.2024.
//

import Foundation
import SwiftUI

final class SceneDelegate: NSObject, UIWindowSceneDelegate {
        
    let coordinator: Coordinator<FlowRouter> = .init(startingRoute: .splash)
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = coordinator.navigationController
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
        coordinator.start()
    }
}
