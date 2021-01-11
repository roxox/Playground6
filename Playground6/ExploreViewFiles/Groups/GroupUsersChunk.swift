//
//  GroupUsersChunk.swift
//  Playground6
//
//  Created by Sebastian Fox on 01.01.21.
//

import SwiftUI

struct GroupUsersChunk: View {
    // constants
    let itemWidth: CGFloat = (deviceWidth-30)/2
    let itemHeight: CGFloat = (deviceWidth-30)/2*1.35
    let numberOfGroups = 4
    
    // grid layout
    var fixedLayout: [GridItem] {
        [
            .init(.fixed((deviceWidth-30)/2)),
            .init(.fixed((deviceWidth-30)/2))
        ]
    }
    
    // parameter from outside
    var users: [AppUser] // war mal chunk (kommt aus chunk)
    
    // Methods
//    func getNumberPlaceholders(chunk: [AppUser]) -> Int {
//        if chunk.count < numberOfGroups {
//            let numberOfCards = numberOfGroups - chunk.count
//            return numberOfCards
//        }
//        return 0
//    }
    
    var body: some View {
        LazyVGrid(columns: fixedLayout) {
            ForEach(users, id: \.self) { user in
                user.image
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .frame(width: itemWidth, height: itemHeight)
                    .cornerRadius(15)
                    
                    .overlay(
                        UserOverlay(user: user)
                    )
            }
            
//            ForEach(0..<getNumberPlaceholders(chunk: users), id: \.self) { card in
//                PlaceholderCard(id: card)
//            }
        }
    }
}


struct UserOverlay: View {
    var user: AppUser
    
    var body: some View {
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
    }
}

struct PlaceholderCard: View {
    // constants
    let itemWidth: CGFloat = (deviceWidth-30)/2
    let itemHeight: CGFloat = (deviceWidth-30)/2*1.35
    
    var id: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color ("super_bright_gray"))
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
                    
                    Text(id == 0 ? "Hier könnte dein Bild zu sehen sein" : id == 1 ? "oder hier" : "oder vielleicht hier")
                        .font(.systemSemibold(size: 10))
                        .foregroundColor(Color ("mid_gray"))
                }
            )
    }
}

//struct GroupUsersChunk_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupUsersChunk()
//    }
//}
