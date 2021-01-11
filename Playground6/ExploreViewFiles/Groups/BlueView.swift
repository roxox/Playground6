//
//  BlueView.swift
//  Playground6
//
//  Created by Sebastian Fox on 01.01.21.
//

import SwiftUI

struct BlueView: View {
    
    var body: some View {
        VStack() {
        Text("Hallo")
            .background(Color.blue)
        
        
            ScrollView(.vertical) {
//                VStack {
                Rectangle()
                    .fill(Color .white)
                    .frame(height: 20)
                    
                    GroupItemView()
                    
                Rectangle()
                    .fill(Color .white)
                    .frame(height: 60)
//                }
    //        }
            }
        }
    }
}

struct BlueView_Previews: PreviewProvider {
    static var previews: some View {
        BlueView()
    }
}
