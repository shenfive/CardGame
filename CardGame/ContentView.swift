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

//    let columns = [
//        GridItem(.flexible()),       // 平均分配
//        GridItem(.flexible()),       // 平均分配
//        GridItem(.flexible()),       // 平均分配
//        GridItem(.flexible()),       // 平均分配
//        GridItem(.flexible())       // 平均分配
//    ]
    let columns = Array(repeating: GridItem(.flexible()), count: 5)

    @State var numberOfCards = 20
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: columns,spacing: 0) {
                    ForEach(0..<numberOfCards,id:\.self){ index in
                        CardView(emoji: emojis[index])
                            .aspectRatio(3/4, contentMode: .fit) // 維持 4:3 直立比例
                            .frame(maxWidth: .infinity)          // 吃滿欄位寬
                            .padding(4)
                    }
                }
            }
            HStack{
                Button(action: {
                    if numberOfCards < 50{
                        numberOfCards += 1
                    }
                }) {
                    Image(systemName: "plus.circle")
                        .font(.title)
                }
                Spacer()
                Button(action: {
                    if numberOfCards > 1 {
                        numberOfCards -= 1
                    }
                }) {
                    Image(systemName: "minus.circle")
                        .font(.title)
                }

            }
        }
        .padding()
//        .animation(.easeInOut,value: numberOfCards)
    }
}

#Preview {
    ContentView()
}
