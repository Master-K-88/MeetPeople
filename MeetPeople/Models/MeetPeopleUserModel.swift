//
//  MeetPeopleUserModel.swift
//  MeetPeople
//
//  Created by Prof K on 10/6/22.
//

import Foundation

struct MeetPeoplUserModel: Codable {
    let results: [UserModel]?
}

struct UserModel: Codable {
    let gender: String
    let name: UserNameModel?
    let location: UserLocationModel?
    let email: String
    let picture: UserPictureModel?
}

struct UserNameModel: Codable {
    let title: String
    let first: String
    let last: String
}

struct UserLocationModel: Codable {
    let street: UserStreetModel?
    let city: String
    let state: String
    let country: String
    let postcode: Int?
    let coordinates: UserCoordinates?
    let timezone: UserTimeZone
}

struct UserStreetModel: Codable {
    let number: Int
    let name: String
}

struct UserCoordinates: Codable {
    let latitude: String
    let longitude: String
}

struct UserTimeZone: Codable {
    let offset: String
    let description: String
}

struct UserPictureModel: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}
