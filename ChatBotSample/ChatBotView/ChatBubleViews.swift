//
//  UserBubleView.swift
//  ChatTest
//
//  Created by Ali Fayed on 10/10/2022.
//

import SwiftUI
struct UserBubleView: View {
    let message: String
    let bkColor: Color
    let fgColor: Color
    let font: Font?
    let timeFont: Font
    let timeColor: Color
    let cornerRadiusAmout: CGFloat
    let messageTime: String
    var body: some View {
        let newUserMessage = message.replacingOccurrences(of: "user", with: "")
        HStack {
            Spacer()
            RoundedBackgroundWithImage(backgroundColor: Color(""), imageName: "", width: 40, hegiht: 40)
            VStack(alignment: .trailing) {
                Text(newUserMessage)
                    .padding()
                    .foregroundColor(fgColor)
                    .font(font)
                    .background(bkColor)
                    .cornerRadius(cornerRadiusAmout, corners: [.topLeft, .bottomRight])
                    .padding(.horizontal, 16)
                    .padding(.bottom, 10)
                Text(messageTime)
                    .padding(.top, -15)
                    .padding(.trailing, 20)
                    .frame(alignment: .leading)
                    .foregroundColor(timeColor)
                    .font(timeFont)
            }
        }.padding(.bottom, -10).padding(.top, 5)
    }
}
struct BotMessageBuble: View {
    let message: String
    let backgroundColor: Color
    let font: Font?
    let circleBackgroundColor: Color
    let cornerRadiusAmout: CGFloat
    let isMultipeMessage: Bool
    var body: some View {
        HStack {
            if !isMultipeMessage {
                RoundedBackgroundWithImage(backgroundColor: circleBackgroundColor, imageName: Constants.botImage, width: 40, hegiht: 40)
                    .padding()
                    .padding(.trailing, -25)
                    .padding(.leading, 10)
            } else {
                RoundedBackgroundWithImage(backgroundColor: Color(""), imageName: "", width: 40, hegiht: 40)
                    .padding()
                    .padding(.trailing, -25)
                    .padding(.leading, 10)
            }
            Text(message)
                .font(font)
                .padding()
                .background(backgroundColor)
                .cornerRadius(cornerRadiusAmout, corners: [.topLeft, .bottomRight])
                .padding(.horizontal, 16)
            Spacer()
        }.padding(.top, -10).padding(.bottom, -5).padding(.leading, -15)
    }
}
