//
//  MeetPeopleAPIEndpoint.swift
//  MeetPeople
//
//  Created by Prof K on 10/6/22.
//

import Foundation
enum MeetPeopleAPIEndpoint {
    case testing
    var API: String {
        switch self {
        case .testing:
            return "https://randomuser.me/apiT%20https://randomuser.me/api"
        }
    }
}
