//
//  SearchViewModel.swift
//  MeetPeople
//
//  Created by Prof K on 10/7/22.
//

import Combine
import Foundation

class SearchViewModel: ObservableObject  {
    
    @Published var userCellViewModels = [UserListCellViewModel]()
    @Published var userProfiles = [UserModel]()
    private var subscriptions: Set<AnyCancellable> = Set<AnyCancellable>()
    let userService: MeetPeopleAPIProtocol = UserService()
    @Published var searchText = ""
    @Published var showingAlert = false
    
    init () {
        fetchData()
    }
    func fetchData() {
        for index in 1 ..< 4 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index)) { [weak self] in
                guard let self = self else { return }
                self.userService.fetchData(endpoint: "")
                    .receive(on: RunLoop.main)
                    .sink { completion in
                        print("There is a completion: \(completion) here")
                    } receiveValue: { [weak self] userProfile in
                        let userCellVM = UserListCellViewModel(userProfile: userProfile)
                        self?.userCellViewModels.append(userCellVM)
                        
                    }
                    .store(in: &self.subscriptions)
            }
        }
    }
    var searchResults: [UserListCellViewModel] {
            if searchText.isEmpty {
                return userCellViewModels
            } else {
                return userCellViewModels.filter { searchResult in
                    guard let lastNamePresent = searchResult.userProfile.name?.last.contains(searchText),
                          let firstNamePresent = searchResult.userProfile.name?.first.contains(searchText) else {
                        return false
                    }
                    return lastNamePresent || firstNamePresent
                    
                }
            }
        }
}
