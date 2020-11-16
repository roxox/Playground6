//
//  MenuControl.swift
//  Playground6
//
//  Created by Sebastian Fox on 25.10.20.
//

import SwiftUI
import Combine

class MenuControl: ObservableObject {
    
    
    @Published var showSearchMenu: Bool = false
        {
           willSet {
            showSearchMenuWillChange.send(newValue)
           }
       }
    
    @Published var showCategoryMenu: Bool = false
        {
           willSet {
            showCategoryMenuWillChange.send(newValue)
           }
       }
    
    @Published var showUserSelectedMenu: Bool = false //= false
        {
           willSet {
            showUserSelectedMenuWillChange.send(newValue)
           }
       }
    
    @Published var selectedUser: AppUser!
        {
           willSet {
            selectedUserWillChange.send(newValue)
           }
       }
    
    public let showSearchMenuWillChange = PassthroughSubject<Bool,Never>()
    public let showCategoryMenuWillChange = PassthroughSubject<Bool,Never>()
    public let showUserSelectedMenuWillChange = PassthroughSubject<Bool,Never>()
    
    public let selectedUserWillChange = PassthroughSubject<AppUser,Never>()
}
