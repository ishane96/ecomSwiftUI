//
//  ContentView.swift
//  SwiftUI
//
//  Created by Achintha Kahawalage on 2021-05-10.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth

enum Roots {
    case login
    case home
}

class ViewRouter: ObservableObject {
//    @Published var currentRoot: Roots = LocalUser.current() == nil ? .login : LocalUser.current()?.type == 1 ? .artistHome : .venueHome

    @Published var currentRoot: Roots = Auth.auth().currentUser == nil ? .login : .home

    static let shared = ViewRouter()

    init() {
        print(currentRoot)
    }
}
