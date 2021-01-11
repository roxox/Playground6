//
//  NewExploreView.swift
//  Playground6
//
//  Created by Sebastian Fox on 01.01.21.
//

import SwiftUI

struct NewExploreView: View {
    @State var index = 0
    
    var body: some View {
        LazyVStack() {
            Rectangle().frame(width: 50, height: 390)
        TabView(selection: $index) {
            BlueView().tag(0)
            RedView().tag(1)
//            GroupsView2()
//                .tag(0)
//            GroupsView2()
//                .tag(1)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }
    }
}

struct NewExploreView_Previews: PreviewProvider {
    static var previews: some View {
        NewExploreView()
    }
}
