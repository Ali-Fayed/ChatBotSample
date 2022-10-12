//
//  Constant.swift
//  ChatTest
//
//  Created by Ali Fixed on 12/10/2022.
//

import Foundation
import SwiftUI
struct Constants {
    static let bubleFont: Font = .system(size: 14, weight: .medium)
    static let topBarFont: Font = .system(size: 20, weight: .bold)
    static let topBarBottomTitleFont: Font = .system(size: 15, weight: .bold)
    static let messageTimeFont: Font = .system(size: 11, weight: .regular)
    static let sendMessageButtonFont: Font = .system(size: 26)
    static let viewTitle = "ChatBot"
    static let bottomTitle = "Welcome to the smart assistant"
    static let languageCircleColor: Color = Color("greyOa")
    static let colorGreen = "colorGreen"
    static let backButtonImage = "chevron.backward"
    static let textFieldPlaceholder = "Type something"
    static let lowOpacityGray: Color = Color.gray.opacity(0.1)
    static let sendMessgaeIcon = "paperplane.fill"
    static let darkGreenColor = "colorGreenTxt"
    static let botImage = "Subtraction 5"
    static let botBubleBackgroundColor = Color.gray.opacity(0.15)
    static let boxCategoryWidth = UIScreen.main.bounds.width * 0.2
    static let categoryBoxFont: Font = .system(size: 13, weight: .medium)
    static func messageTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        return "Sent \(dateString) ✓"
    }
}
