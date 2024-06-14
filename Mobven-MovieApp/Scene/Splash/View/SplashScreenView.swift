//
//  SplashScreenView.swift
//  Mobven-MovieApp
//
//  Created by Elif Tum on 9.06.2024.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var coordinator: Coordinator<FlowRouter>
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.spTop,Color.spButtom]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            Image(.splashScreenIcon)
            
                .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    coordinator.show(.tabbar)
                }
            })
        }
        
    }
}

#Preview {
    @State var env = Coordinator<FlowRouter>()
    return SplashScreenView().environmentObject(env)
}
