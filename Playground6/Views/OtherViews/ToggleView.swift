//
//  ToggleView.swift
//  Playground6
//
//  Created by Sebastian Fox on 07.12.20.
//

import SwiftUI

struct ToggleView: View {
    @Binding var toggleOn: Bool
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: self.toggleOn ? .leading : .trailing) {
                Capsule()
                    .frame(width: geo.size.width * 0.7, height: geo.size.width * 0.1, alignment: .center)
                    .foregroundColor(.white)
                Capsule()
                    .frame(width: geo.size.width * 0.35, height: geo.size.width * 0.1, alignment: .center)
//                    .overlay(Capsule().stroke(Color.pink, lineWidth: 4))
                    .foregroundColor(.black)
                    .overlay(Text(toggleOn ? "Gruppen" : "Personen").foregroundColor(.white).fixedSize()  )
            }
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.2)) {
                    self.toggleOn.toggle()
                }
            }
        }
    }
}
