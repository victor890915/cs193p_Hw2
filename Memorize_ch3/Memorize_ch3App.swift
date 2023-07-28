//
//  Memorize_ch3App.swift
//  Memorize_ch3
//
//  Created by 鄭勝偉 on 2023/7/13.
//

import SwiftUI

@main
struct Memorize_ch3App: App {
    let game = EmojiMemoryGame()
//    EmojimemoryGame is a class , therefore let game is a pointer
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
