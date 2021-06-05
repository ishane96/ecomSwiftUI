//
//  SignUpVM.swift
//  ecommerceSwiftUI
//
//  Created by Achintha Kahawalage on 2021-05-27.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

class SignUpVM: ObservableObject {
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var mobile = ""
    @Published var address = ""
    @Published var password = ""
    
    @Published var shownAlert = false
    @Published var errorMsg = ""
    
    func register(completion: @escaping CompletionHandler){
        
        //local Validation
        if fullName == "" || email == "" || mobile == "" || address == "" || password == ""{
            self.errorMsg = .AnyFieldEmpty
            self.shownAlert = true
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [self] response, error in
            if let error = error {
                errorMsg = error.localizedDescription
                shownAlert = true
                print(error.localizedDescription)
            } else{
                self.saveInfo(fullName: fullName, email: email, mobile: mobile, address: address, password: password)
                completion(true, 200, "")
            }
        }
    }
    
    func saveInfo(fullName: String, email: String, mobile: String, address: String, password: String){
        let db = Firestore.firestore()
        db.collection("Users").document().setData(["fullName": fullName, "email": email, "mobile": mobile, "address": address, "password": password])
    }
}
