//
//  SecuredTextFieldWithErrorHandler.swift
//  MeetPeople
//
//  Created by Prof K on 10/6/22.
//

import Foundation
import SwiftUI

struct SecuredFieldWithErrorHandler: View {
    
    //MARK: Constant for the textfield
    let fontSize: CGFloat
    let textColor: Color
    let bgColor: Color
    let alignText: TextAlignment
    let placeHolder: String
    //MARK: State field Object
    @Binding var field: String
    
    //MARK: Prompt message
    var prompt: String = "Must be between 6 and 15 characters containing at least one number and one capital letter"
    @Binding var isHighlighted: Bool
    
    init(field: Binding<String>, isHighlighted: Binding<Bool>, fontSize: CGFloat = 14, bgColor: Color = Color("tfColor"), textColor: Color = .white, alignText: TextAlignment = .leading, prompt: String, placeHolder: String) {
        self._field = field
        self._isHighlighted = isHighlighted
        self.fontSize = fontSize
        self.bgColor = bgColor
        self.textColor = textColor
        self.alignText = alignText
        self.prompt = prompt
        self.placeHolder = placeHolder
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            SecureField(placeHolder, text: $field)
                .disableAutocorrection(true)
                .frame(height: 50)
                .padding(.horizontal)
                .foregroundColor(isHighlighted ? .red : Color("btnColor"))
                .multilineTextAlignment(alignText)
                .background(bgColor)
                .border(isHighlighted ? .red : .clear)
                .cornerRadius(10)
            Text(isHighlighted ? prompt : "")
                .offset(y: -8)
                .foregroundColor(.red)
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
    }
}
