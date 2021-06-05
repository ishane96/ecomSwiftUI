//
//  FirebaseUser.swift
//  ecommerceSwiftUI
//
//  Created by Achintha Kahawalage on 2021-05-27.
//

import UIKit

public struct FirebaseUser: Codable {

    public var _id: String?
    public var firebaseId: String?
    public var firstName: String?
    public var lastName: String?
    public var email: String?
    public var avatarUrl: String?
    
    public init(_id: String?, firebaseId: String?, firstName: String?, lastName: String?, email: String?, avatarUrl: String?) {
        self._id = _id
        self.firebaseId = firebaseId
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.avatarUrl = avatarUrl
    }
    
    public enum CodingKeys: String, CodingKey {
        case _id = "id"
        case firebaseId = "firebase_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case avatarUrl = "avatar_url"
    }
}

