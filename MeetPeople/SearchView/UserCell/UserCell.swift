//
//  UserCell.swift
//  MeetPeople
//
//  Created by Prof K on 10/6/22.
//

import SwiftUI
struct UserCell: View {
    
    @ObservedObject var userCellViewModel: UserListCellViewModel

    var body: some View {
        ZStack {
            Color("testColor")
                .ignoresSafeArea()
            HStack(spacing: 15) {
                KingfisherImageView(url: userCellViewModel.userProfile.picture?.medium ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .padding(.top, 10)
            
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("\(userCellViewModel.userProfile.name?.title ?? "") \(userCellViewModel.userProfile.name?.first ?? "")")
                        .foregroundColor(Color("btnColor"))
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    
                    Text(" \(userCellViewModel.userProfile.name?.last ?? "")")
                        .foregroundColor(Color("btnColor"))
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                }
                HStack {
                    Text("\(userCellViewModel.userProfile.location?.street?.number ?? 0)")
                        .foregroundColor(Color.gray)
                        .font(.subheadline)
                    
                    Text(userCellViewModel.userProfile.location?.street?.name ?? "")
                        .foregroundColor(Color.gray)
                        .font(.subheadline)
                    
                    Text(userCellViewModel.userProfile.location?.city ?? "")
                        .foregroundColor(Color.gray)
                        .font(.subheadline)
                }
                HStack {
                    Text("\(userCellViewModel.userProfile.location?.state ?? "" ),")
                        .foregroundColor(Color.gray)
                        .font(.subheadline)
                    
                    Text("\(userCellViewModel.userProfile.location?.country ?? "")")
                        .foregroundColor(Color.gray)
                        .font(.subheadline)
                }
                
                HStack {
                    Text("E-mail: ")
                        .foregroundColor(Color.gray)
                        .font(.subheadline)
                    
                    Text("\(userCellViewModel.userProfile.email)")
                        .foregroundColor(Color("btnColor"))
                        .font(.subheadline)
                }
                
            }
            Spacer()
            
        }
        .padding(.horizontal, 10)
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(userCellViewModel: UserListCellViewModel(userProfile: UserModel(gender: "male", name: UserNameModel(title: "Mr. ", first: "Korede", last: "Oko-osi"), location: UserLocationModel(street: UserStreetModel(number: 6, name: "Beatric Kolawolee "), city: "Ikorodu", state: "Lagos", country: "Nigeria", postcode: 101211, coordinates: UserCoordinates(latitude: "1.1", longitude: "2.5"), timezone: UserTimeZone(offset: "", description: "")), email: "email.com", picture: UserPictureModel(large: "", medium: "", thumbnail: ""))))
            .previewInterfaceOrientation(.portrait)
    }
}
