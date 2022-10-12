//
//  ChatBotModel.swift
//  ChatTest
//
//  Created by Ali Fayed on 10/10/2022.
//

import Foundation
struct QestionsAndAnswers {
    let question: String
    let answer: [String]
}
struct MessagesModel: Hashable {
    let message: String
    let isMultipeMessage: Bool
}
