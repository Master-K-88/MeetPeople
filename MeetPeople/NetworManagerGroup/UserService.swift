//
//  UserService.swift
//  MeetPeople
//
//  Created by Prof K on 10/7/22.
//

import Combine
import Foundation

class UserService: MeetPeopleAPI<MeetPeopleNetworking>, MeetPeopleAPIProtocol {
    
    private var subscriptions: Set<AnyCancellable> = Set<AnyCancellable>()
    
    func fetchData(endpoint: String) -> Future<UserModel, Error> {
        return Future<UserModel, Error> { [weak self] promise in
            guard let self = self else { return promise(.failure(NetworkError.unknown))}
                self.fetchData(target: .fetchUserData(endpoint: endpoint), responseClass: MeetPeoplUserModel.self)
                    .receive(on: RunLoop.main)
                    .sink { completion in
                        print("Completion: \(completion)")
                    } receiveValue: { result in
                        guard let userProfile = result.results?.first else {
                            return
                        }
                        promise(.success(userProfile))
                    }
                    .store(in: &self.subscriptions)
        }
    }
    
    
}
