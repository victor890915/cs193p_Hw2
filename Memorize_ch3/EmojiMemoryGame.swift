//
//  EmojiMemoryGame.swift
//  Memorize_ch5
//
//  Created by 鄭勝偉 on 2023/7/13.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    
    
    class theme{
        var emojis = [
            ["😘","😎","🥳","😡","🥲","😍","😚","😶‍🌫️","🤢","🤓"],
            ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨"],
            ["🍏","🍎","🍐","🍋","🍊","🍌","🍉","🍇","🍓","🫐"],
            ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱"],
            ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚒","🛻"],
            ["🩷","❤️","🧡","💛","💚","🩵","💙","💜","🖤","🩶"]
        ]
        var themeName = ["emojis","animals","fruits","sports","veichels","hearts"]
        var themeColor = [Color.pink,Color.blue,Color.brown,Color.yellow,Color.green,Color.orange]
    }
    
    static var themeList = theme()
    
    var randomThemeNum:Int = 0
    
    static func createMemoryGame(themeNum: Int) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) {pairIndex in
            EmojiMemoryGame.themeList.emojis[themeNum][pairIndex]
            //EmojiMemoryGame.emojis0[themeNum][pairIndex]
        }
    }
    
    
    
    @Published private var model : MemoryGame<String> = EmojiMemoryGame.createMemoryGame(themeNum:0)
   //private(set) others can peek into (read) the MemoryGame struct, but not alter it
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    var currentScore: Int {
        return model.scoreOfGame
    }
    
    // MARK: -Intent(s)
    func choose(_ card:MemoryGame<String>.Card){
//        objectWillChange.send() @published takes care of this line
        model.choose(card)
    }
    
    func newGame()-> Void{
        for index in EmojiMemoryGame.themeList.emojis.indices{
            EmojiMemoryGame.themeList.emojis[index].shuffle()
        }
        model = EmojiMemoryGame.createMemoryGame(themeNum: { () -> Int in
            randomThemeNum=Int.random(in: 0..<6)
            return randomThemeNum }())
    }
}
