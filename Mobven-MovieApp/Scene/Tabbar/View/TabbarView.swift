//
//  TabbarView.swift
//  Mobven-MovieApp
//
//  Created by Elif Tum on 9.06.2024.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(.homepage)
                }
            TicketsView()
                .tabItem {
                    Image(.tickets)
                }
            WatchListView()
                .tabItem {
                    Image(.watchList)
                }
            ProfileView()
                .tabItem {
                    Image(.profile)
                }
        }.background(.darkBackground)
        
    }
}

#Preview {
    TabbarView()
}
