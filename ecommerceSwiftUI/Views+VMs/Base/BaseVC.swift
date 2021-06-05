//
//  BaseVC.swift
//  ecommerceSwiftUI
//
//  Created by Achintha Kahawalage on 2021-05-28.
//

import Foundation

class BaseVC: View {
    
    func logoutUser() {
        do { try Auth.auth().signOut() }
            catch { print("already logged out") }
        ViewRouter.shared.currentRoot = .login
    }
}
