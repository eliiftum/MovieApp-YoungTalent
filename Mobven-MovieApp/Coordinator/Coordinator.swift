//
//  Coordinator.swift
//  Mobven-MovieApp
//
//  Created by Elif Tum on 9.06.2024.
//
import UIKit
import SwiftUI

open class Coordinator<Router: NavigationRouter>: ObservableObject {
    
    public let navigationController: UINavigationController
    public var startingRoute: Router?
    
    public init(navigationController: UINavigationController = .init(), startingRoute: Router? = nil) {
        self.navigationController = navigationController
        self.startingRoute = startingRoute
    }
    
    public func start() {
        guard let route = startingRoute else { return }
        show(route)
    }
    
    public func show(_ route: Router, animated: Bool = true) {
        let view = route.view()
        let viewWithCoordinator = view.environmentObject(self)
        let viewController = UIHostingController(rootView: viewWithCoordinator)
        switch route.transition {
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
        case .presentModally:
            viewController.modalPresentationStyle = .formSheet
            navigationController.present(viewController, animated: animated)
        case .presentFullscreen:
            viewController.modalPresentationStyle = .fullScreen
            navigationController.present(viewController, animated: animated)
        }
    }
    
    public func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    public func popToRoot(animated: Bool = true) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    open func dismiss(animated: Bool = true) {
        navigationController.dismiss(animated: true) { [weak self] in
            /// because there is a leak in UIHostingControllers that prevents from deallocation
            self?.navigationController.viewControllers = []
        }
    }
    
    open func makeRootView() {
         // Yeni bir root view oluşturun
         guard let route = startingRoute else { return }
         let rootView = route.view()
         let rootViewWithCoordinator = rootView.environmentObject(self)
         
         // Yeni bir UIHostingController oluşturun
         let newRootViewController = UIHostingController(rootView: rootViewWithCoordinator)
         
         // navigationController'ın rootViewController'ını güncelleyin
         navigationController.setViewControllers([newRootViewController], animated: true)
     }
}
