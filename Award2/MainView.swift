//
//  MainView.swift
//  Award2
//
//  Created by Yurii Sameliuk on 27/12/2021.
//

import SwiftUI

struct MainView: View {
    @Namespace private var nameSpace
    
    @State private var isLaunchPresented: Bool = true
    
    var body: some View {
        VStack(spacing: 0) {
            if isLaunchPresented {
                LaunchView(nameSpace: nameSpace)
                    .transition(.move(edge: .top))
            } else {
                ChristmasView(nameSpace: nameSpace)
            }
        }
        .background(
            Image("background1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
        )
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { (timer) in
                withAnimation() {
                    isLaunchPresented = false
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
