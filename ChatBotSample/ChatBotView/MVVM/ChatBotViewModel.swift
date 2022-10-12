//
//  ChatBotCustomViews.swift
//  ChatTest
//
//  Created by Ali Fayed on 10/10/2022.
//

import Foundation
import SwiftUI
class chatBotViewModel: ObservableObject {
    @ObservedObject var kGuardian = KeyboardGuardian(textFieldCount: 1)
    @Published var messages: [MessagesModel] = [.init(message: "Welcome brother Mohammed how can I help you?", isMultipeMessage: false)]
    @Published var categories: [String] = []
    @Published var messageText = ""
    @Published var isTextEntryEnabled = false
    @Published var isNeedToScrollDown = false
    @Published var suggestionQandA: [QestionsAndAnswers] = [.init(question: "can I suggest add more features for app?", answer: ["no you can't these days", "wait for us next month", "or call 1966"]), .init(question: "can I suggest add more content?", answer: ["Yes send us"])]
    
    @Published var inquiryQandA: [QestionsAndAnswers] = [.init(question: "can I apply for etkaf?", answer: ["yes you can"]), .init(question: "can I apply for mwaed eftar", answer: ["no in ramdan"])]
    
    @Published var complaintQandA: [QestionsAndAnswers] = [.init(question: "i complained from app crash", answer: ["send us app crash video in our mail support@gmail.com"]), .init(question: "i complained from non-translated content", answer: ["send us screen shot with non-translated content"])]
    
    @Published var requestQandA: [QestionsAndAnswers] = [.init(question: "can I request a visit", answer: ["yes you can"]), .init(question: "can i call some one", answer: ["please call 1966 ..."])]
    
    func gotCategoryResponse(categoryName: String) -> (String, [QestionsAndAnswers]) {
        switch categoryName {
        case "Suggest":
            return ("What is your suggestion?", suggestionQandA)
        case "Complain":
            return ("What is your complaint?", complaintQandA)
        case "Request":
            return ("What is your request ?", requestQandA)
        case "Inquiry":
            return ("What is your inquiry?", inquiryQandA)
        default:
            return ("", [])
        }
    }
    
    func goChatBotResponse(categoryName: String, textFieldEntry: String) -> [String] {
        let textFieldEntry = textFieldEntry.lowercased()
        for item in gotCategoryResponse(categoryName: String(categoryName.dropFirst(4))).1 {
            if item.question.contains(textFieldEntry) {
                return item.answer
            }
        }
        return ["Please call 1966"]
    }
    func displayCategoryBoxes() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation {
                self.messages.append(MessagesModel(message: "Please choose the type of your question is it", isMultipeMessage: true))
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    self.categories.append("Suggest")
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                    self.categories.append("Complain")
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                    self.categories.append("Request")
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
                    self.categories.append("Inquiry")
                }
            }
        }
    }
    func categoryBoxTapped(categoryName: String, completion: @escaping ()->()) {
        if self.categories.count == 4 {
            normalHapicFeedback()
            self.categories.removeAll()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.replyWithCategoryUserMessage(Category: categoryName)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                completion()
            }
        }
    }
    func sendMessage(message: String, textFieldEntry: String) {
        withAnimation {
            self.messages.append(MessagesModel(message: "user" + message, isMultipeMessage: false))
            self.messageText = ""
            let choosedCategory = self.messages[2].message
            let answersArray = self.goChatBotResponse(categoryName: choosedCategory, textFieldEntry: textFieldEntry)
            var dispatchTime = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(dispatchTime))) {
                withAnimation {
                    self.messages.append(MessagesModel(message: answersArray[0], isMultipeMessage: false))
                    for answer in answersArray.dropFirst() {
                        dispatchTime = dispatchTime + 0.5
                        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(dispatchTime))) {
                            self.messages.append(MessagesModel(message: answer, isMultipeMessage: true))
                        }
                    }
                }
            }
        }
    }
    func replyWithCategoryUserMessage(Category: String) {
        withAnimation {
            self.messages.append(MessagesModel(message: "user" + Category, isMultipeMessage: false))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.messages.append(MessagesModel(message: self.gotCategoryResponse(categoryName: Category).0, isMultipeMessage: false))
                }
            }
        }
    }
    func callSupportTapped(message: MessagesModel) {
        if message.message.contains("1966") {
            let phoneNumber =  "1966"
            UIApplication.shared.open(URL(string: "tel://" + phoneNumber)!)
            normalHapicFeedback()
        }
    }
    func normalHapicFeedback() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}
