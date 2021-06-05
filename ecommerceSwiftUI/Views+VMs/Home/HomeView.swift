//
//  HomeView.swift
//  ecommerceSwiftUI
//
//  Created by Achintha Kahawalage on 2021-05-27.
//

import SwiftUI
import FirebaseAuth
import SDWebImageSwiftUI

struct HomeView: View {
    
    var body: some View {
        
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                CustomNavigation(isBackButton: false, title: "Home", editButton: false)
                ScrollView{
                    VStack{
                        Products()
                            .padding([.top,.leading])
                        CardView()
                    }
                }
            }
            
        }.edgesIgnoringSafeArea(.top)
    }
    
    
}

struct Products: View {
    @StateObject var vm = HomeVM()
    var body: some View{
        
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<vm.items.count, id: \.self) {index in
                    ZStack{
                        Color.blue
                        
                        WebImage(url: URL(string: vm.items[index].itemUrl ?? ""))
                            .resizable()
                            .placeholder {
                                ProgressView()
                            }
                    }
                    .overlay(
                        VStack {
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .fill(Color("#D94DA1"))
                                    
                                Text(vm.items[index].item_price ?? "")
                                    .foregroundColor(Color.white)
                            }
                            .frame(height:42)
                            .background(Color.white)
                        }
                        
                    )
                    .frame(width: 175, height: 244)
                    .cornerRadius(18.0)
                }
            }
                .onAppear(perform: {
                    getData()
                })
        }
    }
    
    func getData(){
        vm.fetchItems()
    }
    
}

struct CardView: View {
    @ObservedObject var vm = HomeVM()
    
    var body: some View{
        VStack(spacing:20){
            HStack {
                Text("New in")
                    .font(.system(size: 18))
                Spacer()
            }
            
            ForEach(0..<vm.items.count, id: \.self) {index in
                VStack {
                    WebImage(url: URL(string: vm.items[index].itemUrl ?? ""))
                        .resizable()
                        .placeholder {
                            ProgressView()
                        }
                        .frame(height: 220)
                        .cornerRadius(18.0)
                    VStack {
                        HStack{
                            Text(vm.items[index].item_name ?? "")
                                .font(.system(size: 14))
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "heart")
                                    .foregroundColor(Color("#D94DA1"))
                            })
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "bookmark")
                                    .foregroundColor(Color("#D94DA1"))
                            })
                        }
                        HStack {
                            Text(vm.items[index].item_price ?? "")
                                .font(.system(size: 14))
                            Spacer()
                        }
                    }
                }
            }
            
        }.padding()
        .onAppear(perform: {
            getData()
        })
    }
    
    func getData(){
        vm.fetchItems()
    }
}

struct TestView: View {
    
    let spacing: CGFloat = 10
    let hPadding: CGFloat = 10
    
    let columns = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View{
        
//        ScrollView {
            HStack{
                LazyVStack( spacing: spacing){
                    ForEach(0..<30){_ in
                        Rectangle()
                            .foregroundColor(Color.black)
                            .frame(height: CGFloat.random(in: 100...200))
                    }
                }
                
                LazyVStack( spacing: spacing){
                    ForEach(0..<30){_ in
                        Rectangle()
                            .foregroundColor(Color.black)
                            .frame(height: CGFloat.random(in: 100...200))
                    }
                }

                
            }
        }
        
    }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
