//
//  SearchView.swift
//  MeetPeople
//
//  Created by Prof K on 10/6/22.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel = SearchViewModel()
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        ForEach(viewModel.searchResults, id: \.id) { userCellViewModel in
                            UserCell(userCellViewModel: userCellViewModel)
                                .padding(10)
                                
//                                .cornerRadius(25)
                        }
                    }
                }
                .searchable(text: $viewModel.searchText)
                .navigationTitle("Search")
                .navigationBarTitleDisplayMode(.inline)
//                .navigationBarBackButtonHidden(true)
                .foregroundColor(Color("btnColor"))
                .alert("Are you sure you want to Log out?", isPresented: $viewModel.showingAlert) {
                            Button("No", role: .cancel) { }
                    Button("Yes") {
                        if #available(iOS 15, *) {
                            dismiss()
                        }
                        else {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                        }
                .toolbar {
                                    ToolbarItem(placement: .navigationBarTrailing) {
                                        Button("Logout") {
                                            print("Help tapped!")
                                            viewModel.showingAlert = true
                                        }
                                    }
                                }
        }
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

