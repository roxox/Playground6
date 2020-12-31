//
//  UserList3.swift
//  Playground6
//
//  Created by Sebastian Fox on 23.11.20.
//


// TODO:

// 1. View für 4x4 Matrix für User oder Placeholder
// 2. View für jedes Event (Image wenn verfügbar, Titel, Zeit, Ort, Buttons, TabView -> [4x4 Matrix (USERS CHUNK)])
// 3. List für alls Events
// 4. TabView für Events und User
import SwiftUI

struct UsersList4: View {
    
    let itemWidth: CGFloat = (deviceWidth-30)/2
    let itemHeight: CGFloat = (deviceWidth-30)/2*1.35
//    let itemHeight: CGFloat = (deviceWidth-30)/2*1.2
    let testDistances = ["200m", "300m", "350m", "800m", "1km", "2km", "2km", "3km"]
    let circleSize: CGFloat = 50
    let numberOfGroups = 4
    
    @State var selectedUser: AppUser = appUserData[0]
    @State var currentPage = 0
    
    @Binding var users: [AppUser]
    @Binding var createNewGroup: Bool
    
    var appGroup: AppUserGroup
    var hardUsers: [AppUser]
    var fixedLayout: [GridItem] {
        [
            .init(.fixed((deviceWidth-30)/2)),
            .init(.fixed((deviceWidth-30)/2))
        ]
    }
    
    func getRandomName() -> AppUser {
        let randomInt = Int.random(in: 0..<appUserData.count)
        return appUserData[randomInt]
    }
    
    func getRandomDistance() -> String {
        let randomInt = Int.random(in: 0..<testDistances.count)
        return testDistances[randomInt]
    }
    
    func getPlaceholders(chunk: [AppUser]) -> Int {
        if chunk.count < numberOfGroups {
            let numberOfCards = numberOfGroups - chunk.count
            return numberOfCards
        }
        return 0
    }
    
    func getNumberOfUserChunks() -> Int {
        return getUserChunks().count
    }
    
    func getUserChunks() -> [[AppUser]] {
        let splitSize = numberOfGroups
        let chunks = stride(from: 0, to: hardUsers.count, by: splitSize).map {
            Array(hardUsers[$0..<min($0 + splitSize, hardUsers.count)])
        }
        return chunks
    }
    
    func getChunk(identifier: Int) -> Array<AppUser> {
        
        let splitSize = numberOfGroups
        let chunks = stride(from: 0, to: hardUsers.count, by: splitSize).map {
            Array(hardUsers[$0..<min($0 + splitSize, hardUsers.count)])
        }
        return chunks[identifier]
    }
    
    @ViewBuilder
    func fetchUserChunk(chunk: [AppUser]) -> some View {
        LazyVGrid(columns: fixedLayout) {
            ForEach(chunk, id: \.self) { user in
                
                user.image
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .frame(width: itemWidth, height: itemHeight)
                    .cornerRadius(15)
//                    .shadow(radius: 2, y: 1)
                    
                    .overlay(
                        ZStack() {
                            VStack() {
                                gradient
                            }
                            
                            VStack(alignment: .center) {
                                Spacer()
                                HStack() {
                                    
                                    Text("Los Angeles")
                                        .font(.systemBold(size: 12))
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                
                                HStack() {
                                    Text(user.username)
                                        .font(.systemMedium(size: 17))
                                        .lineLimit(1)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                .padding(.bottom, 14)
                            }
                            .padding(.leading, 14)
                        }
                        .cornerRadius(15)
                    )
            }
            
            ForEach(0..<getPlaceholders(chunk: chunk), id: \.self) { card in
                RoundedRectangle(cornerRadius: 15)
//                    .fill(Color.clear)
                    .fill(Color ("super_bright_gray"))
//                    .fill(VisualEffectView(effect: UIBlurEffect(style: .light)))
                    .frame(width: itemWidth, height: itemHeight)
                    .overlay(
                        VisualEffectView(effect: UIBlurEffect(style: .light))
                            .cornerRadius(15)
                    )
                    .overlay(
                        VStack() {
                            Image(systemName: "person.crop.circle.fill.badge.xmark")
                                .font(.systemSemibold(size: 45))
                                .foregroundColor(Color ("mid_gray"))
                            
                            Text(card == 0 ? "Hier könnte dein Bild zu sehen sein" : card == 1 ? "oder hier" : "oder vielleicht hier")
                                .font(.systemSemibold(size: 10))
                                .foregroundColor(Color ("mid_gray"))
                        }
                    )
            }
        }
    }
    
    var body: some View {
        
        LazyVStack() {
            
            
            
            NavigationLink(destination: GroupDetailView(group: appGroup)) {
                HStack {
                    ZStack(){
                        self.appGroup.image
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFill()
                            .frame(width: circleSize, height: circleSize)
                            .clipShape(Circle())
                    }
                    
                    ZStack(){
                        HStack() {
                            VStack(alignment: .leading) {
                                
                                HStack(alignment: .center) {
                                    Text(appGroup.title!)
                                        .font(.systemMedium(size: 22))
                                        .foregroundColor(Color .black)
//                                        .foregroundColor(Color .white)
                                        .lineLimit(1)
                                }
                                
                                HStack() {
                                    Text("Heute • Los Angeles, \(getRandomDistance())")
                                        .font(.systemMedium(size: 17))
                                        .foregroundColor(Color .black)
//                                        .foregroundColor(Color .white)
                                        .offset(y: -1)
                                }
                                .lineLimit(1)
                            }
                            Spacer()
                            
                            VStack() {
                                HStack(alignment: .top){
                                    Image(systemName: "bookmark")
                                        .font(.systemBold(size: 20))
                                        .imageScale(.medium)
                                        .foregroundColor(Color .black)
//                                        .foregroundColor(Color .white)
                                        .frame(width: 28, height: 28)
                                    
                                    Image(systemName: "arrowshape.turn.up.forward")
                                        .font(.systemBold(size: 20))
                                        .imageScale(.medium)
                                        .foregroundColor(Color .black)
//                                        .foregroundColor(Color .white)
                                        .frame(width: 28, height: 26)
                                }
                                Spacer()
                            }
                            .padding(.trailing,5)
                            
                        }
                    }
                }
//                .padding(.horizontal, 10)
//                .padding(.vertical, 15)
//                .background(Color ("midnight"))
//                .background(Color.white)
//                .background(VisualEffectView(effect: UIBlurEffect(style: .light)))
//                .cornerRadius(15)
//                .shadow(radius: 1)
                .padding(.horizontal, 10)
                .padding(.bottom, 7)
            }
            
//            ScrollView(.horizontal) {
//                HStack() {
//            PageView(
//                [
            
            TabView(selection: $currentPage){
                    ForEach(getUserChunks(), id: \.self) { chunk in
                        fetchUserChunk(chunk: chunk)
                    }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//                ] , currentPage: $currentPage
//                )
//                }
//            }
            
            
            //            LazyVGrid(columns: fixedLayout) {
            //                ForEach(getChunk(identifier: 0), id: \.self) { user in
            //
            //                    user.image
            //                        .renderingMode(.original)
            //                        .resizable()
            //                        .scaledToFill()
            //                        .frame(width: itemWidth, height: itemHeight)
            //                        .cornerRadius(15)
            //                        .shadow(radius: 2, y: 1)
            //
            //                        .overlay(
            //                            ZStack() {
            //                                VStack() {
            //                                    gradient
            //                                }
            //
            //                                VStack(alignment: .center) {
            //                                    Spacer()
            //                                    HStack() {
            //                                        Text("Los Angeles")
            //                                            .font(.systemBold(size: 12))
            //                                            .foregroundColor(.white)
            //                                        Spacer()
            //                                    }
            //
            //                                    HStack() {
            //                                        Text(user.username)
            //                                            .font(.systemMedium(size: 17))
            //                                            .lineLimit(1)
            //                                            .foregroundColor(.white)
            //                                        Spacer()
            //                                    }
            //                                    .padding(.bottom, 14)
            //                                }
            //                                .padding(.leading, 14)
            //                            }
            //                            .cornerRadius(15)
            //                        )
            //                }
            //
            //                ForEach(0..<getEmptyCards(), id: \.self) { card in
            //                    RoundedRectangle(cornerRadius: 15)
            //                        .fill(Color ("super_bright_gray"))
            //                        .frame(width: itemWidth, height: itemHeight)
            //                        .overlay(
            //                            VStack() {
            //                                Image(systemName: "person.crop.circle.fill.badge.xmark")
            //                                    .font(.systemSemibold(size: 45))
            //                                    .foregroundColor(Color ("mid_gray"))
            //
            //                                Text(card == 0 ? "Hier könnte dein Bild zu sehen sein" : card == 1 ? "oder hier" : "oder vielleicht hier")
            //                                    .font(.systemSemibold(size: 10))
            //                                    .foregroundColor(Color ("mid_gray"))
            //                            }
            //                        )
            //                }
            //            }
            
            HStack(alignment: .center) {
                Text("8 Teilnehmer, 5 interessiert")
                    .font(.systemMedium(size: 16))
                                        .foregroundColor(Color .black)
//                                        .foregroundColor(Color .white)
                    .lineLimit(1)
                    .padding(5)
                    .background(Color ("super_bright_gray"))
//                    .background(VisualEffectView(effect: UIBlurEffect(style: .light)))
                    .cornerRadius(5)
//                    .shadow(radius: 2, y: 1)
                    
                    .padding(.leading, 10)
                    .padding(.vertical, 8)
                
                Text("Essen und Trinken")
                    .font(.systemMedium(size: 16))
                                        .foregroundColor(Color .black)
//                                        .foregroundColor(Color .white)
                    .lineLimit(1)
                    .padding(5)
                    .background(Color ("super_bright_gray"))
//                    .background(VisualEffectView(effect: UIBlurEffect(style: .light)))
                    .cornerRadius(5)
//                    .shadow(radius: 2, y: 1)
                    
                    .padding(.trailing, 10)
                    .padding(.vertical, 8)
                Spacer()
            }
            .padding(.bottom, 20)
        }
    }
}

struct TestView: View {
    
    var body: some View {
        VStack(){
            Spacer()
            HStack() {
                Spacer()
                
                Text("Hallo").padding(.horizontal, 15).background(Color.red).foregroundColor(.blue)
                Spacer()
            }
            Spacer()
        }
    }
}
