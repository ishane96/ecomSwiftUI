//
//  MoreView.swift
//  ecommerceSwiftUI
//
//  Created by Achintha Kahawalage on 2021-05-29.
//

import SwiftUI
import Firebase

struct MoreView: View {
    var body: some View {
        VStack{
            Button(action: logoutUser, label: {
                Text("logout")
            })
        }
    }
    func logoutUser() {
        do { try Auth.auth().signOut() }
            catch { print("already logged out") }
        ViewRouter.shared.currentRoot = .login
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
