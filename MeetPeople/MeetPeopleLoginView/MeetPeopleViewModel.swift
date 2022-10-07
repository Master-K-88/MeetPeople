//
//  MeetPeopleViewModel.swift
//  MeetPeople
//
//  Created by Prof K on 10/6/22.
//

import Combine
import Foundation

class MeetPeopleViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isHighlighted: Bool = false
    @Published var isSecureHighlighted: Bool = false
    
    private var subscriptions: Set<AnyCancellable> = Set<AnyCancellable>()
    
    private var loginEmailValidationPublisher: AnyPublisher<Bool, Never> {
        $username
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0.isEmailValid() }
            .eraseToAnyPublisher()
    }
    
    private var loginPasswordValidationPublisher: AnyPublisher<Bool, Never> {
        $password
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0.isPasswordValid() }
            .eraseToAnyPublisher()
    }
    
    func loginTapped() {
        print("I am here")
        loginEmailValidationPublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] value in
                print("The received value is \(value)")
                self?.isHighlighted = !value
            })
            .store(in: &subscriptions)
        
        loginPasswordValidationPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] value in
                self?.isSecureHighlighted = !value
            }
            .store(in: &subscriptions)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.isHighlighted = false
            self?.isSecureHighlighted = false
            self?.subscriptions.removeAll()
        }
    }
    
    
}
