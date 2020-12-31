//
//  TestView2.swift
//  Playground6
//
//  Created by Sebastian Fox on 17.12.20.
//

import SwiftUI

struct TestView2: View {
    @State var currentPage = 0
    @State var currentPage2 = 0
    @State var index = 0
    @State var createNewGroup: Bool = true
    @State var users = appUserData
    
    private let items: [String] = ["Gruppen", "Personen"]
    
    var body: some View {
           
        ScrollView() {
            VStack{
                
                ////
                TabView(selection: $index) {
//                    UsersView(users: $users, createNewGroup: $createNewGroup)
//                        .tag(0)
                    UsersView3(users: $users, createNewGroup: $createNewGroup)
                        .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//                Text("Below the Paging")
//
//                TabView(selection: $currentPage){
//                    TestView3(tag: 1).tag(1)
//                    TestView3(tag: 2).tag(2)
//                    TestView3(tag: 3).tag(3)
//                    TestView3(tag: 4).tag(4)
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                TabView(selection: $currentPage2){
//                    TestView3(tag: 10).tag(10)
//                    TestView3(tag: 20).tag(20)
//                    TestView3(tag: 30).tag(30)
//                    TestView3(tag: 40).tag(40)
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
            }
        }
        
//        VStack() {
//
//                HStack() {
//                    Spacer()
//                        SegmentedPicker(items: items, selection: $index)
//                    Spacer()
//                }
//                .padding(.horizontal, 80)
////
//                TabView(selection: $index) {
//                    Color.red
//                        .tag(0)
//                        .tabItem {
//                            Image(systemName: "house.fill")
//                                .font(.systemBold(size: 24))
//                        }
//
//                    Color.blue
//                        .tag(1)
//                        .tabItem {
//                            Text("Hallo")
//                        }
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
////                Text("Below the Paging")
//
//                PageView([
//                    TestView(),
//                    TestView()
//                ], currentPage: $currentPage)
//            }
//        }
    }
}

struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        TestView2()
    }
}

struct TestView3: View {
    var tag: Int
    var body: some View {
        VStack{
            Text(tag.description)
            Image(systemName: "checkmark")
        }.frame(width: 200, height: 200, alignment: .center).background(Color.green)
    }
}
