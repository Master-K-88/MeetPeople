//
//  MeetPeopleAPI.swift
//  MeetPeople
//
//  Created by Prof K on 10/6/22.
//

import Foundation
import Combine

protocol MeetPeopleAPIProtocol {
    func fetchData(endpoint: String) -> Future<UserModel, Error>
}
