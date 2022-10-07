//
//  UserListCellViewModel.swift
//  MeetPeople
//
//  Created by Prof K on 10/6/22.
//

import Foundation

class UserListCellViewModel: ObservableObject, Identifiable {
    
    @Published var userProfile: UserModel
    
    init(userProfile: UserModel) {
        self.userProfile = userProfile
    }
    
    
}
