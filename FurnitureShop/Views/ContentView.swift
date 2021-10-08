//
//  ContentView.swift
//  FurnitureShop
//
//  Created by Danh Tu on 07/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Image("chair_1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .edgesIgnoringSafeArea(.top)
                        
                        DescriptionView()
                    }
                }
                .padding(.bottom, 80)
                
                HStack {
                    Text("$1299")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Add to Cart")
                            .fontWeight(.bold)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(10)
                            .foregroundColor(Color("Primary"))
                    })
                }
                .padding()
                .padding()
                .background(Color("Primary"))
                .cornerRadius(50, corners: .topLeft)
                .frame(maxHeight: .infinity, alignment: .bottom)
                // Right now there is no direct method to apply a corner radius to a specific side on SwiftUI
                // That's why we created our own extension
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Luxury Swedia\nChair")
                .font(.title)
                .fontWeight(.bold)
            
            HStack(spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            
            HStack {
                Text("Description")
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(.vertical)
                
                Text("Review")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .foregroundColor(Color("Primary"))
            }
            
            Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. ")
                .lineSpacing(8)
                .opacity(0.6)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("Height: 120cm")
                        .opacity(0.6)
                    Text("Wide: 120cm")
                        .opacity(0.6)
                    Text("Diameter: 120cm")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("Jati Wood, Canvas,\nAmazing Love")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Color")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    HStack {
                        ColorDotView(color: Color.white)
                        ColorDotView(color: Color.black)
                        ColorDotView(color: Color("Primary"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Quantity")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    HStack {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "minus")
                                .padding(8)
                                .frame(width: 30, height: 30)
                                .overlay(Circle().strokeBorder())
                                .foregroundColor(Color.black)
                        })
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "plus")
                                .padding(8)
                                .frame(width: 30, height: 30)
                                .background(Color("Primary"))
                                .clipShape(Circle())
                                .foregroundColor(Color.white)
                        })
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40)
        .offset(y: -40)
    }
}
