//
//  ContentView.swift
//  CardGame
//
//  Created by Danny Shen on 2025/12/16.
//

import SwiftUI

struct ContentView: View {
    // 定義一組 emoji 候選字元
    let emojis = ["😀","😅","😂","😍","😎","🤩","🥳","😴","🤯","😇", "🤓","🧐","😡","😭","😱","🤔","🙄","😤","😷","🤒", "👻","💩","👽","🤖","🎃","🐶","🐱","🐭","🐹","🐰", "🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐸","🐵", "🐔","🐧","🐦","🐤","🐣","🐥","🦆","🦅","🦉","🦇", "🐺","🐗","🐴","🦄","🐝","🐛","🦋","🐌","🐞","🐜"].shuffled()
//    let columns = [GridItem(.flexible()),
//                   GridItem(.flexible()),
//                   GridItem(.flexible()),
//                   GridItem(.flexible()),
//                   GridItem(.flexible())]
    let columns = Array(repeating: GridItem(.flexible()), count: 5) // 全部平均分配
    @State var numberOfCards = 20 //卡片數量
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: columns,spacing: 0) {
                    ForEach(0..<numberOfCards,id:\.self){ index in
                        CardView(emoji: emojis[index])
                            .aspectRatio(3/4, contentMode: .fit) // 維持 4:3 直立比例
                            .frame(maxWidth: .infinity)          // 吃滿欄位寬
                            .padding(4)
                    }}}
            HStack{
                Button(action: {
                    numberOfCards += numberOfCards < 50 ? 1:0
                }) {Image(systemName: "plus.circle").font(.title)}
                Spacer()
                Button(action: {
                    numberOfCards -= numberOfCards > 1 ? 1:0
                }) { Image(systemName: "minus.circle").font(.title) }}}
        .padding()
        .animation(.easeInOut,value: numberOfCards)
    }
}

#Preview {
    ContentView()
}
