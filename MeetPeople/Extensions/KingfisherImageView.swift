//
//  KingfisherImageView.swift
//  MeetPeople
//
//  Created by Prof K on 10/6/22.
//

import Foundation
import SwiftUI
import struct Kingfisher.KFImage

@ViewBuilder
func KingfisherImageView(url: String) -> KFImage {
    KFImage(URL(string: url))
        .onSuccess { result in
            print("This is the result \(result)")
        }
        .onFailure { error in
            print("There is an error of \(error.localizedDescription)")
        }
        .placeholder {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .padding(5)
        }
}
