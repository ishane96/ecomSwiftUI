//
//  CustomTextField.swift
//  ecommerceSwiftUI
//
//  Created by Achintha Kahawalage on 2021-05-27.
//

import SwiftUI

struct CustomTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .foregroundColor(Color("#57636F"))
            .font(Font.custom("Manrope-SemiBold", size: 14))
            .frame(height: 62)
            .padding(.horizontal,15)
            .background(Color("#F6F6F7"))
            .cornerRadius(30.0)
    }
}
