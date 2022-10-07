//
//  ContentView.swift
//  MeetPeople
//
//  Created by Prof K on 10/3/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = MeetPeopleViewModel()
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 70) {
                loginTitle
                loginFields
            }
        }
        .fullScreenCover(isPresented: $viewModel.isShowingSecondView, onDismiss: didDismiss) {
            SearchView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

extension ContentView {
    
    var loginTitle: some View {
        Text("Login")
            .multilineTextAlignment(.center)
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(Color("btnColor"))
    }
    
    var loginFields: some View {
        VStack(alignment: .trailing, spacing: 20) {
            TextFieldWithErrorHandler(field: $viewModel.username, isHighlighted: $viewModel.isHighlighted, prompt: "Invalid email format", placeHolder: "Email")
            SecuredFieldWithErrorHandler(field: $viewModel.password, isHighlighted: $viewModel.isSecureHighlighted, prompt: "Must be between 6 and 15 characters containing at least one number and one capital letter", placeHolder: "Password")
            Button {
                viewModel.loginTapped()
//                viewModel.isHighlighted = true
//                viewModel.isHighlighted = true
            } label: {
                Text("Login")
                    .bold()
                    .foregroundColor(Color("bgColor"))
                    .padding(.horizontal, 20)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color("btnColor"))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            
            
            
            
            

        }
    }
}

private extension ContentView {
    func didDismiss() {
    }
}
