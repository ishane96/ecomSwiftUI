//
//  ContentView.swift
//  SwiftUI
//
//  Created by Achintha Kahawalage on 2021-05-26.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct LoginView: View {
    
    @State var signUpTapped = false
    @State var togglePw = true
    @State var googleSignInTapped = false
    
    @StateObject var vm = LoginVM()
    
    var body: some View {
        
        NavigationView{
            VStack (spacing:0){
                LazyVStack(alignment: .leading, spacing: 0){
                    HStack {
                        Spacer()
                        NavigationLink(destination: SignUpView()){
                            Text("SIGN UP")
                                .modifier(TextModifier.ZillaSlab_MediumItalic_14x_white())
                        }
                    }
                    VStack (alignment: .leading, spacing:20){
                        Text("Sign In")
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
                        Text("Email")
                            .font(.system(size: 12))
                        TextField("Email", text: $vm.email)
                            .autocapitalization(.none)
                            .textFieldStyle(CustomTextField())
                        
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
                        
                        HStack{
                            Spacer()
                            NavigationLink(destination: ForgotPasswordView()) {
                                Text("Forgot Password?")
                                    .modifier(TextModifier.Quicksand_Regular_12x_E41A4A())
                            }
                        }
                        
                        Button(action: loginCall, label: {
                            HStack {
                                Spacer()
                                Text("SIGN IN")
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
                        
                        HStack {
                            Spacer()
                            Text("or Sign in with social media")
                                .modifier(TextModifier.Quicksand_Regular_14x_7A8D9C())
                            Spacer()
                        }
                        
                        VStack (spacing:20){
                            HStack {
                                Spacer()
                                Button(action: googleSignIn, label: {
                                    Image("google")
                                        .resizable()
                                        .frame(height:62)
                                })
                                Spacer()
                            }
                            
                            HStack {
                                Spacer()
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image("fb")
                                        .resizable()
                                        .frame(height:62)
                                })
                                Spacer()
                            }
                        }
                        .padding(.top,30)
                    }
                    .padding(.all,30)
                }
            }
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
        }
    }
    func loginCall(){
        vm.login ()
    }
    
    func googleSignIn(){
        self.googleSignInTapped = true
        GIDSignIn.sharedInstance().presentingViewController = UIApplication.shared.windows.first?.rootViewController
        
        GIDSignIn.sharedInstance().signIn()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
