//
//  ContentView.swift
//  SwiftUI
//
//  Created by Achintha Kahawalage on 2021-05-10.
//

import Foundation
import Combine
import SwiftUI
import Firebase

struct RootView: View {
    
    @EnvironmentObject var router: ViewRouter
    
    var body: some View {
        VStack {
            containedView()
                .id(router.currentRoot)
        }
    }
    
    func containedView() -> AnyView {
        switch router.currentRoot {
        case .login:
            return AnyView(LoginView())
        case .home:
            return AnyView(CustomTabBar())
        }
    }
}
