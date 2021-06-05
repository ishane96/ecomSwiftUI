//
//  BaseVM.swift
//  ecommerceSwiftUI
//
//  Created by Achintha Kahawalage on 2021-05-28.
//

import Foundation
import FirebaseAuth

class BaseVM: ObservableObject {
    
    func logoutUser() {
        do { try Auth.auth().signOut() }
            catch { print("already logged out") }
        ViewRouter.shared.currentRoot = .login
    }
}
