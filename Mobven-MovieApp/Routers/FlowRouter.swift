//
//  FlowRouters.swift
//  Mobven-MovieApp
//
//  Created by Elif Tum on 9.06.2024.
//
import SwiftUI
import UIKit

public enum DeeplinkFunctions : Int {
    case home = 0
}
public enum TabViewList: Int {
    case home = 0
    case history = 1
    case vip = 2
    case prefs = 3
}
public enum FlowRouter : NavigationRouter {
    
    case splash
    case home
    case tabbar
    case detailMovie(movieId: Int)
    case deeplink(DeeplinkFunctions: Int)
    public var transition: NavigationTransitionStyle
    {
        switch self {
        default:
            return .push
        }
    }
    
    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .splash:
            SplashScreenView()
        case .home:
            HomeView()
        case .detailMovie(let movieId):
            MovieDetailView(viewModel: MovieDetailViewModel(movieId: movieId))
        case .tabbar:
            TabbarView()
        case .deeplink(let deeplinkFunctions):
            switch deeplinkFunctions {
            default:
                Text("Page is Not Found!.")
            }
        }
    }
}
