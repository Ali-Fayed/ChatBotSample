//
//  ChatBotView.swift
//  ChatTest
//
//  Created by Ali Fayed on 10/10/2022.
//

import SwiftUI

struct ChatBotView: View {
    @ObservedObject private var viewModel = chatBotViewModel()
    var body: some View {
        VStack {
            let chatBotViewsLibrary = ChatBotViewsLibrary(viewModel: viewModel)
            chatBotViewsLibrary.chatBotTopBarView()
            chatBotViewsLibrary.chatBotBublesScrollView()
            if viewModel.isTextEntryEnabled {
            chatBotViewsLibrary.chatBotBottomTextfieldWithButtonView()
            }
        }.onAppear{
            viewModel.displayCategoryBoxes()
        }.onTapGesture {
            UIApplication.shared.endEditing()
        }.offset(y: viewModel.kGuardian.slide).animation(.easeInOut(duration: 0.5))
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBotView()
    }
}
