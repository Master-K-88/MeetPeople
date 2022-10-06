//
//  MeetPeopleNetworking.swift
//  MeetPeople
//
//  Created by Prof K on 10/6/22.
//

import Foundation

enum MeetPeopleNetworking {
    // Other case can be added here depending on the TASK like (POST and DELETE)
    case fetchUserData(endpoint: String)
}

extension MeetPeopleNetworking: TargetType {
    
    var path: String {
        switch self {
        case .fetchUserData:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchUserData:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .fetchUserData:
            return .getRequest
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return MeetPeopleAPIEndpoint.testing.API
        }
    }
}
