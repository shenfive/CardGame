//
//  CardView.swift
//  CardGame
//
//  Created by Danny Shen on 2025/12/16.
//

import SwiftUI


struct CardView: View {
    let emoji: String
    @State private var isFaceUp = true
    @State private var rotation: Double = 0
    var body: some View {
        ZStack {
            // 正面
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .stroke(Color.red, lineWidth: 2)
                Text(emoji).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            //背面
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.red)
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(rotation),axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.4)) {
                rotation += 180
                isFaceUp.toggle()
            }
        }
    }
}

#Preview {
    CardView(emoji: "😍")
}
