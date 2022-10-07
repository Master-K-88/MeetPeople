//
//  SearchView.swift
//  MeetPeople
//
//  Created by Prof K on 10/6/22.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel = SearchViewModel()
    var body: some View {
        NavigationView {
            
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        ForEach(viewModel.userCellViewModels, id: \.id) { userCellViewModel in
                            UserCell(userCellViewModel: userCellViewModel)
                                .padding(.horizontal, 10)
                        }
                    }
                }
                .navigationTitle("Search")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .foregroundColor(Color("tfColor"))
        }
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

//ForEach(viewModel.userCellViewModels, id: \.id) { cellViewModel in
