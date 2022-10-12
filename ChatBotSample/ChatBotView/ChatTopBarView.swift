//
//  TopBar.swift
//  ChatTest
//
//  Created by Ali Fayed on 10/10/2022.
//

import SwiftUI

struct ChatTopBarView: View {
    let backButtonImage: String
    let viewTitle: String
    let bottomTitle: String
    let titleFont: Font?
    let bottomTitleFont: Font?
    let circleBackgroundColor: Color
    let viewBackgroundColorString: String
    let languageCircleWidthAndHeight: CGFloat
    var backBtnPressed: () -> Void
    var languageBtnPressed: () -> Void
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: backButtonImage)
                        .font(titleFont)
                        .foregroundColor(Color.white)
                    Text(viewTitle)
                        .foregroundColor(Color.white)
                        .font(titleFont)
                }.padding(.leading, 13).padding(.bottom, 20)
                Spacer()
                RoundedBackGroundWithText(backgroundColor: circleBackgroundColor, text: "En", width: languageCircleWidthAndHeight, hegiht: languageCircleWidthAndHeight).padding(.trailing, 13).padding(.bottom, 20).onTapGesture {
                    languageBtnPressed()
                }
            }.padding(.top, 5).background(Color(viewBackgroundColorString))
                .onTapGesture {
                    backBtnPressed()
                }
            VStack {
                Text(bottomTitle)
                    .font(bottomTitleFont)
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.black)
                    .background(Color.gray.opacity(0.15))
                    .padding(.top, -10)
            }
        }.padding(.bottom, 10)
    }
}
