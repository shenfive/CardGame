//
//  ContentView.swift
//  CardGame
//
//  Created by Danny Shen on 2025/12/16.
//

import SwiftUI

struct ContentView: View {

//    let columns = [
//        GridItem(.flexible()),       // 平均分配
//        GridItem(.flexible()),       // 平均分配
//        GridItem(.flexible()),       // 平均分配
//        GridItem(.flexible()),       // 平均分配
//        GridItem(.flexible())       // 平均分配
//    ]
    let columns = Array(repeating: GridItem(.flexible()), count: 5)
    var numberOfCards = 100
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns,spacing: 0) {
                ForEach(0..<numberOfCards,id:\.self){ index in
                    CardView(emoji: "😍")
                        .aspectRatio(3/4, contentMode: .fit) // 維持 4:3 直立比例
                        .frame(maxWidth: .infinity)          // 吃滿欄位寬
                        .padding(5)
                }
            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
