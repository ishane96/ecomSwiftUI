//
//  ForgotPasswordView.swift
//  ecommerceSwiftUI
//
//  Created by Achintha Kahawalage on 2021-06-05.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @StateObject var vm = ForgotPasswordVM()
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack (spacing:0){
            LazyVStack(alignment: .leading, spacing: 0){

                VStack (alignment: .leading, spacing:20){
                    Text("Forgot Password")
                        .modifier(TextModifier.ZillaSlab_MediumItalic_24x_white())
                    
                    Text("Enter your logged in email to reset password.")
                        .modifier(TextModifier.ZillaSlab_MediumItalic_14x_white())
                }
                .padding(.top,50)
                
            }
            .padding(.top,80)
            .frame(height:250)
            .padding([.horizontal,.bottom],20)
            .background(Color("#7BCFE9"))
            .cornerRadius(30, corners: [.bottomLeft,.bottomRight])
            
            ScrollView{
                VStack(alignment: .leading, spacing:15){
                    Text("Email")
                        .font(.system(size: 12))
                    TextField("Email", text: $vm.email)
                        .autocapitalization(.none)
                        .textFieldStyle(CustomTextField())
                    
                    
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text("RESET PASSWORD")
                                .modifier(TextModifier.QuicksandBold_13x_white())
                            
                            Spacer()
                        }
                        .frame(height:62)
                        .background(Color("#126881"))
                        .cornerRadius(30.0)
                    })
                    .padding(.top)
//                    .alert(isPresented: self.$vm.shownAlert) {
//                        Alert(title: Text("Alert"),
//                              message: Text(self.vm.errorMsg),
//                              dismissButton: .default(Text("Dismiss")))}
                    
                }
                .padding(.all,30)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentation.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "arrow.left")
                .foregroundColor(Color.white)
        }))
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
