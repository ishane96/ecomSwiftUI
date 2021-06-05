//
//  SignUpView.swift
//  ecommerceSwiftUI
//
//  Created by Achintha Kahawalage on 2021-05-27.
//

import SwiftUI

struct SignUpView: View {
   
    
    @StateObject var vm = SignUpVM()
    @State var togglePw = true
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        VStack (spacing:0){
            LazyVStack(alignment: .leading, spacing: 0){
                HStack {
                    Spacer()
//                    NavigationLink(destination: SignUpView()){
                        Text("SIGN IN")
                            .modifier(TextModifier.ZillaSlab_MediumItalic_14x_white())
                            .onTapGesture(perform: {
                                self.presentation.wrappedValue.dismiss()
                            })
//                    }
                }
                VStack (alignment: .leading, spacing:20){
                    Text("Sign Up")
                        .modifier(TextModifier.ZillaSlab_MediumItalic_24x_white())
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer maximus accumsan erat id facilisis.")
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
                    
                    Group{
                    Text("Full Name")
                        .font(.system(size: 12))
                    TextField("Jason Statham", text: $vm.email)
                        .textFieldStyle(CustomTextField())
                    
                    Text("Phone Number")
                        .font(.system(size: 12))
                    TextField("+94777227031", text: $vm.email)
                        .textFieldStyle(CustomTextField())
                        .keyboardType(.phonePad)
                    
                    Text("Email")
                        .font(.system(size: 12))
                    TextField("Email", text: $vm.email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .textFieldStyle(CustomTextField())
                    }
                    Text("Password")
                        .font(.system(size: 12))
                    
                    if togglePw{
                        ZStack{
                            SecureField("Password", text: $vm.password)
                                .textFieldStyle(CustomTextField())
                            
                            HStack {
                                Spacer()
                                Button(action: {
                                    self.togglePw.toggle()
                                }, label: {
                                    Image(systemName:"eye.slash.fill")
                                        .foregroundColor(Color("#ACBAC3"))
                                })
                            }.padding(.trailing)
                        }
                    } else {
                        ZStack{
                            TextField("Password", text: $vm.password)
                            HStack {
                                Spacer()
                                Button(action: {
                                    self.togglePw.toggle()
                                }, label: {
                                    Image(systemName:"eye.fill")
                                        .foregroundColor(Color("#ACBAC3"))
                                })
                            }.padding(.trailing)
                        }.textFieldStyle(CustomTextField())
                    }
                    
                    Button(action: registerCall, label: {
                        HStack {
                            Spacer()
                            Text("SIGN UP")
                                .modifier(TextModifier.QuicksandBold_13x_white())
                            
                            Spacer()
                        }
                        .frame(height:62)
                        .background(Color("#126881"))
                        .cornerRadius(30.0)
                    })
                    .padding(.top)
                    .alert(isPresented: self.$vm.shownAlert) {
                        Alert(title: Text("Alert"),
                              message: Text(self.vm.errorMsg),
                              dismissButton: .default(Text("Dismiss")))}
                    
                }
                .padding(.all,30)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
    }
    
    func registerCall(){
        vm.register { success, statusCode, message in
            if success{
                ViewRouter.shared.currentRoot = .home
            }
        }
    }
    
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
