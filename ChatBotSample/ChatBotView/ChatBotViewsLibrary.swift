//
//  ChatBotViewsLibrary.swift
//  ChatTest
//
//  Created by Ali Fixed on 12/10/2022.
//

import SwiftUI

class ChatBotViewsLibrary {
    @ObservedObject var viewModel = chatBotViewModel()
    init(viewModel: chatBotViewModel = chatBotViewModel()) {
        self.viewModel = viewModel
    }
    func chatBotUserChatBubleView(messageModel: MessagesModel) -> some View {
        return UserBubleView(message: messageModel.message, bkColor: Color(Constants.colorGreen), fgColor: Color.white, font: Constants.bubleFont, timeFont: Constants.messageTimeFont, timeColor: Color.gray, cornerRadiusAmout: 20, messageTime: Constants.messageTime())
    }
    func chatBotBubleViewForBot(messageModel: MessagesModel, scrollViewProxy: ScrollViewProxy) -> some View {
        BotMessageBuble(message: messageModel.message, backgroundColor: Constants.botBubleBackgroundColor, font: Constants.bubleFont, circleBackgroundColor: Color(Constants.darkGreenColor), cornerRadiusAmout: 20, isMultipeMessage: messageModel.isMultipeMessage)
            .onChange(of: viewModel.messages) { msg in
                withAnimation {
                    scrollViewProxy.scrollTo(self.viewModel.messages[self.viewModel.messages.endIndex - 1])
                }
            }.onTapGesture {
                self.viewModel.callSupportTapped(message: messageModel)
            }
    }
    func chatBotCategoryBoxesView() -> some View {
        return CategoriesBoxes(categories: viewModel.categories, width: Constants.boxCategoryWidth, height: 50, fgColor: Color.white, bkColor: Color(Constants.colorGreen), cornerRadius: 10, font: Constants.categoryBoxFont) { catName in
            self.viewModel.categoryBoxTapped(categoryName: catName) {
                self.viewModel.isTextEntryEnabled = true
            }
        }
    }
    func chatBotBublesView(scrollViewProxy: ScrollViewProxy) -> some View {
        return ForEach(Array(viewModel.messages), id: \.self) { message in
            if message.message.contains("user") {
                self.chatBotUserChatBubleView(messageModel: message)
            } else {
                self.chatBotBubleViewForBot(messageModel: message, scrollViewProxy: scrollViewProxy)
            }
        }
    }
    func chatBotBottomTextfieldWithButtonView() -> some View  {
        return TextFieldWithSubmitView(messageText: $viewModel.messageText, placeholder: Constants.textFieldPlaceholder, cornerRadius: 20, backgroundColor: Constants.lowOpacityGray, sendButtonFont: Constants.sendMessageButtonFont, sendButtonForegroundButton: Color(Constants.colorGreen), systemSendButtonImage: Constants.sendMessgaeIcon) {
            if !self.viewModel.messageText.isEmpty {
                self.viewModel.isNeedToScrollDown.toggle()
                self.viewModel.sendMessage(message: self.viewModel.messageText, textFieldEntry: self.viewModel.messageText)
            }
        }
    }
    func chatBotTopBarView() -> some View  {
        return  ChatTopBarView(backButtonImage: Constants.backButtonImage, viewTitle: Constants.viewTitle, bottomTitle: Constants.bottomTitle, titleFont: Constants.topBarFont, bottomTitleFont: Constants.topBarBottomTitleFont, circleBackgroundColor: Constants.languageCircleColor, viewBackgroundColorString: Constants.colorGreen, languageCircleWidthAndHeight: 35) {
            print("Back Btn Pressed")
        } languageBtnPressed: {
            print("Language Btn Pressed")
        }
    }
    func chatBotBublesScrollView() -> some View {
        return ScrollView {
            ScrollViewReader { proxy in
                self.chatBotBublesView(scrollViewProxy: proxy)
                self.chatBotCategoryBoxesView()
            }
        }
    }
}
