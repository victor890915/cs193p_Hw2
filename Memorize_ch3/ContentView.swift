//
//  ContentView.swift
//  Memorize_ch5
//
//  Created by 鄭勝偉 on 2023/7/13.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel:EmojiMemoryGame
    //rebuild contentview when viewModel changed
    
    var body: some View {
        VStack{
            Text("\(EmojiMemoryGame.themeList.themeName[viewModel.randomThemeNum]) matching")
                .font(.title)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                                }
                        }
                    }
                }
                .bold()
                .padding(.horizontal)
                .font(.largeTitle)
            Spacer()
            VStack{
                VStack{
                    Image(systemName:"gamecontroller.fill")
                    Text("New game")
                }
                .bold()
                .onTapGesture{
                    viewModel.newGame()
                }
                Text("Current Score = \(viewModel.currentScore)")
            }
            
        }.foregroundColor(EmojiMemoryGame.themeList.themeColor[viewModel.randomThemeNum])
    }
        

}


struct CardView: View{
    let card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack(alignment: .center){
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 5)
                Text(card.content).font(.body)
            }
//
//            else if card.isMathced{
//                shape.opacity(0)
//            }
            else{
                RoundedRectangle(cornerRadius: 25.0)
                    .fill()
            }
        }
    }
}































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
            
    }
}

