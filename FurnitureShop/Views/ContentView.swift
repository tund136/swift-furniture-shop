//
//  ContentView.swift
//  FurnitureShop
//
//  Created by Danh Tu on 07/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                AppBarView()
                
                TagLineView()
                    .padding()
                
                SearchAndScanView()
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
