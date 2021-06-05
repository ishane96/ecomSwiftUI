//
//  TextModifier.swift
//  ecommerceSwiftUI
//
//  Created by Achintha Kahawalage on 2021-06-05.
//

import Foundation
import SwiftUI

class TextModifier {
    struct ZillaSlab_MediumItalic_24x_white:ViewModifier{
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("ZillaSlab-MediumItalic",
                                  size: 24))
                .foregroundColor(Color.white)
        }
    }
    
    struct ZillaSlab_MediumItalic_14x_white:ViewModifier{
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("ZillaSlab-MediumItalic",
                                  size: 14))
                .foregroundColor(Color.white)
        }
    }
    
    
    struct QuicksandBold_13x_white:ViewModifier{
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Quicksand-Bold",
                                  size: 13))
                .foregroundColor(Color.white)
        }
    }
    
    struct Quicksand_Regular_12x_E41A4A:ViewModifier{
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Quicksand-Regular",
                                  size: 12))
                .foregroundColor(Color("#E41A4A"))
        }
    }

    struct Quicksand_Regular_14x_7A8D9C:ViewModifier{
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Quicksand-Regular",
                                  size: 14))
                .foregroundColor(Color("#7A8D9C"))
        }
    }

}
