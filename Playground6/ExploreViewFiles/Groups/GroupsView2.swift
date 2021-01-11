//
//  GroupsView.swift
//  Playground6
//
//  Created by Sebastian Fox on 01.01.21.
//

import SwiftUI

struct GroupsView2: View {
    var body: some View {
        ScrollView {
            VStack {
            Rectangle()
                .fill(Color .white)
                .frame(height: 20)
                
                GroupItemView()
                
            Rectangle()
                .fill(Color .white)
                .frame(height: 60)
            }
//        }
        }
    }
}

struct GroupsView2_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView2()
    }
}
