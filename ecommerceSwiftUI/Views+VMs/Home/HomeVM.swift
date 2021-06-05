//
//  HomeVM.swift
//  ecommerceSwiftUI
//
//  Created by Achintha Kahawalage on 2021-05-29.
//

import Foundation
import SwiftUI
import Firebase

class HomeVM: ObservableObject {
    
    @Published var items: [Items] = []
    
    
    func fetchItems(){
        let db = Firestore.firestore()
        
        db.collection("Items").getDocuments { response, error in
            
            guard let itemData = response else {return}
            
            self.items = itemData.documents.map({ (doc) -> Items in
                let id = doc.documentID 
                let name = doc.get("item_name") as? String
                let cost = doc.get("item_price") as? String
                let details = doc.get("item_details") as? String
                let image = doc.get("item_image") as? String
                
                return Items(id: id, item_name: name, item_price: cost, itemUrl: image, item_details: details)
            })
        }
    }
}
