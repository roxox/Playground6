//
//  PageView.swift
//  Playground6
//
//  Created by Sebastian Fox on 13.11.20.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
//    @State var currentPage = 0
    @Binding var currentPage: Int

    init(_ views: [Page], currentPage: Binding<Int>) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
        self._currentPage = currentPage
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
//            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
//                .padding(.trailing)
        }
    }
}

//struct PageView_Previews: PreviewProvider {
//    static var previews: some View {
//        PageView(features.map { FeatureCard(landmark: $0) })
//            .aspectRatio(3/2, contentMode: .fit)
//    }
//}
