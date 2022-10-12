//
//  TextFieldWithSubmitView.swift
//  ChatTest
//
//  Created by Ali Fayed on 10/10/2022.
//

import SwiftUI
struct TextFieldWithSubmitView: View {
    var messageText: Binding<String>
    let placeholder: String
    let cornerRadius: CGFloat
    let backgroundColor: Color
    let sendButtonFont: Font
    let sendButtonForegroundButton: Color
    let systemSendButtonImage: String
    @FocusState private var nameIsFocused: Bool
    var function: () -> Void
    var body: some View {
        HStack {
            TextField(placeholder, text: messageText)
                .padding()
                .focused($nameIsFocused)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
            Button {
                function()
                nameIsFocused = false
            } label: {
                RoundedBackgroundWithSystemImage(backgroundColor: sendButtonForegroundButton, imageName: systemSendButtonImage, width: 30, hegiht: 30)
                    .padding(.leading, 10)
                .foregroundColor(sendButtonForegroundButton)
            }.padding(.leading, -80)
            .font(sendButtonFont)
            .padding(.horizontal, 10)
        }.padding(.top, 10).padding(.bottom, 2).padding(.leading, 23).padding(.trailing, -10)
    }
}
