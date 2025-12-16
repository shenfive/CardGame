//
//  CardView.swift
//  CardGame
//
//  Created by Danny Shen on 2025/12/16.
//

import SwiftUI


struct CardView: View {

    let emoji: String
//    let width: CGFloat

    @State private var isFaceUp = true
    @State private var rotation: Double = 0

//    private var height: CGFloat {
//        width * 4.0 / 3.0
//    }

    var body: some View {
        ZStack {
            // 正面
            frontView
                .opacity(isFaceUp ? 1 : 0)

            // 背面（預先旋轉 180°，避免文字倒轉）
            backView
                .opacity(isFaceUp ? 0 : 1)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
        }
//        .frame(width: width, height: height)
        .rotation3DEffect(.degrees(rotation),
                          axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            flipCard()
        }
    }

    private var frontView: some View {
        let shape = RoundedRectangle(cornerRadius: 12)

        return ZStack {
            shape
                .fill(Color.white)
            shape
                .stroke(Color.red, lineWidth: 4)
            Text(emoji)
               
        }
    }

    private var backView: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.red)
    }

    private func flipCard() {
        withAnimation(.easeInOut(duration: 0.4)) {
            rotation += 180
        }

        // 在轉到一半時切換正反面狀態
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    CardView(emoji: "😍")
}
