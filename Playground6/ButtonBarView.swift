//
//  ButtonBarView.swift
//  twentyfour
//
//  Created by Sebastian Fox on 20.04.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import SwiftUI

struct ButtonBarView: View {
    
    @Binding var viewIndex: Int
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.2), Color.black.opacity(0.0)]),
            startPoint: .bottom,
            endPoint: .top)
    }
    
    var body: some View {
//        ZStack() {
        ZStack(alignment: .bottomLeading) {
            
            
            VStack(alignment: .leading) {
//                Divider()
                HStack() {
                    Spacer()
                    
                    Group(){
                    // Lupe
                    Button(action: {
                        self.viewIndex = 0
                    }) {
                        VStack() {
                            
                            Image(systemName: "magnifyingglass")
                                .padding(.vertical, 10.0)
                                .font(.systemBold(size: 24))
                                
                                .frame(width: 50, height: 50)
                                .foregroundColor(viewIndex == 0 ? Color .black : .gray)
                                .offset(x: 0, y: 0)
                        }
                    }
                    
                    Spacer()
                    Button(action: {
                        self.viewIndex = 1
                    }) {
                        VStack() {
                            
                            Image(systemName: "person.2.fill")
                                .padding(.vertical, 10.0)
                                .font(.systemBold(size: 24))
                                .frame(width: 50, height: 50)
                                .foregroundColor(viewIndex == 1 ? Color .black : .gray)
                                .offset(x: 0, y: 0)
                        }
                    }
                    
                    Spacer()
                    
                    //                  Button Message
                    Button(action: {
                        self.viewIndex = 2
                    }) {
                        VStack() {
                            Image(systemName: "bubble.left.fill")
                                .padding(.vertical, 10.0)
                                .font(.systemBold(size: 24))
                                .frame(width: 50, height: 50)
                                .foregroundColor(viewIndex == 2 ? Color .black : .gray)
                                .offset(x: 0, y: 0)
                        }
                    }
                    
                    Spacer()
                    
                    //                  Button Profil
                    Button(action: {
                        self.viewIndex = 3
                    }) {
                        VStack() {
                            Image(systemName: "person.fill")
                                .padding(.vertical, 10.0)
                                .font(.systemBold(size: 24))
                                .frame(width: 50, height: 50)
                                .foregroundColor(viewIndex == 3 ? Color .black : .gray)
                                .offset(x: 0, y: 0)
                        }
                    }
                    }
                    Spacer()
                }
                .padding(.top, 10)
            }
            .background((Color .white)
            .edgesIgnoringSafeArea(.all))
        }
    }
    
    func makeGradient(colors: [Color]) -> some View {
        LinearGradient(
            gradient: .init(colors: colors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
