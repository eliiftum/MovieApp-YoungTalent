//
//  NavigationRouter.swift
//  Mobven-MovieApp
//
//  Created by Elif Tum on 9.06.2024.
//
import UIKit
import SwiftUI

public protocol NavigationRouter {
    
    associatedtype V: View

    var transition: NavigationTransitionStyle { get }
    @ViewBuilder
    func view() -> V
}
