//
//  LoginVM.swift
//  ecommerceSwiftUI
//
//  Created by Achintha Kahawalage on 2021-05-28.
//

import Foundation
import FirebaseAuth
import GoogleSignIn

class LoginVM: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var shownAlert = false
    @Published var errorMsg = ""
    
    func login(){
        
        if email == "" || password == "" {
            self.errorMsg = .AnyFieldEmpty
            self.shownAlert = true
        }
        
        Auth.auth().signIn(withEmail: email, password: password) {[self] response, error in
            if let err = error{
                errorMsg = err.localizedDescription
                shownAlert = true
                print(err.localizedDescription)
            } else {
                ViewRouter.shared.currentRoot = .home
            }
        }
        
        
    }
    
    func googleSignIn(completion: @escaping CompletionHandler){
        
    }
    
}
