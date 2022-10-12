//
//  ChatBotMainViews.swift
//  ChatTest
//
//  Created by Ali Fayed on 10/10/2022.
//

import SwiftUI
struct CategoriesBoxes: View {
    let categories: [String]
    let width: CGFloat
    let height: CGFloat
    let fgColor: Color
    let bkColor: Color
    let cornerRadius: CGFloat
    let font: Font?
    var function: (String) -> Void
    var body: some View {
        HStack(spacing: 0) {
            ForEach(categories, id: \.self) { message in
                ScrollView(.horizontal) {
                    Text(message)
                        .padding(7)
                        .multilineTextAlignment(.center)
                        .frame(width: width, height: height, alignment: .center)
                        .font(font)
                        .foregroundColor(Color.white)
                        .background(bkColor)
                        .cornerRadius(cornerRadius)
                        .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(.green, lineWidth: 0)
                        )
                        .onTapGesture {
                            function(message)
                        }
                }

            }
        }.padding(.top, 20)
            .padding(.leading, UIScreen.main.bounds.width * 0.03)
            .padding(.trailing, UIScreen.main.bounds.width * 0.02)
    }

}
