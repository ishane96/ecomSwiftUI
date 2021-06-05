//
//  CustomNavigation.swift
//  ecommerceSwiftUI
//
//  Created by Achintha Kahawalage on 2021-05-29.
//

import Foundation
import SwiftUI

struct CustomNavigation: View {
    let title:String
    let isBackButton : Bool
    let editButton: Bool
    @State var isLoading = false
    @State var active = false
    //
    @Environment(\.presentationMode) var presentation
    init(isBackButton : Bool,title:String,editButton:Bool) {
        self.isBackButton = isBackButton
        self.title = title
        self.editButton = editButton
    }
    
    var body: some View {
        HStack(spacing:0) {
            Image(systemName: "chevron.left.square.fill")
                .frame(width: 30)
                .padding(.leading)
                .onTapGesture(count: 1, perform: {
                    self.presentation.wrappedValue.dismiss()
                }).opacity(isBackButton ? 1 : 0)
            Spacer()
            Text(title)
                .foregroundColor(Color.black)
                .font(Font.custom("Manrope-Bold", size: 22))
            Spacer()
            Image("")
                .frame(width: 30)
                .padding(.trailing)
                .onTapGesture(count: 1, perform: {
                    self.presentation.wrappedValue.dismiss()
                }).opacity(editButton ? 1 : 0)
        }
        .padding(.top,56)
        .padding(.bottom,5)
        .frame(height:100)
        .background(Color.white)
        .shadow(color: Color("loginShadow"), radius: 16,y:2)
    }
}
