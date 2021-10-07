//
//  ContentView.swift
//  FurnitureShop
//
//  Created by Danh Tu on 07/10/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    
    var body: some View {
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                AppBarView()
                
                TagLineView()
                    .padding()
                
                SearchAndScanView()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< categories.count) { i in
                            CategoryView(isActive: i == selectedIndex, text: categories[i])
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        selectedIndex = i
                                    }
                                }
                        }
                    }
                    .padding()
                }
                
                Text("Popular")
                    .font(.custom("PlayfairDisplay-Regular", size: 24))
                    .padding(.leading)
                
                ProductCardView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {
                
            }, label: {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            })
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image("Profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 42, height: 42)
                    .cornerRadius(10)
            })
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The\nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        +
        Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing)
                TextField("Search Furniture", text: $search)
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.trailing)
            
            Button(action: {
                
            }, label: {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10)
            })
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
            
            if isActive {
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    var body: some View {
        VStack {
            Image("chair_1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 210, height: 210)
                .cornerRadius(20)
            
            Text("Luxury Swedian Chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                
                Spacer()
                
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: 210)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}
