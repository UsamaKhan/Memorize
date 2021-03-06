//
//  ContentView.swift
//  Memorize
//
//  Created by Usama Khan on 5/19/22.
//

import SwiftUI

struct ContentView: View {
//    emojis:
//        vehicles = ["ðē", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "âïļ", "ð", "âĩïļ", "ðļ", "ðķ", "ð", "ð", "ðš", "ð ", "ðĩ", "ð", "ð", "ð", "ðŧ", "ð"]
//        flags = ["ðģïļ", "ðī", "ðīââ ïļ", "ð", "ðĐ", "ðšðģ", "ðšðļ", "ðĻðĶ", "ðŽð§", "ðĩð°", "ðŪðģ", "ðĻðģ", "ðŊðĩ", "ð°ð·", "ðĶðš", "ðŠðļ", "ðŋðĶ", "ðķðĶ", "ðļðĶ", "ðģðĩ", "ðēðŧ", "ðđð·", "ðģïļâð", "ðģïļââ§ïļ"]
//        emotes = ["ð", "ð", "ð", "ðĨē", "ð", "ð", "ðĪŠ", "ð", "ð", "ð­", "ðĪŊ", "ðą", "ðŦ ", "ðŽ", "ðī", "ðĩ", "ðĪŪ", "ð·", "ðĪ ", "ðĪĄ", "ðĐ", "ð―", "ðĪ", "ð"]
//        animals = ["ðķ", "ðą", "ð­", "ðđ", "ð°", "ðĶ", "ðž", "ðŧââïļ", "ðĻ", "ðŊ", "ðĶ", "ðŪ", "ð·", "ðļ", "ðĩ", "ð", "ðĨ", "ðĶ", "ðĶ", "ð", "ðĶ", "ð", "ðĶ", "ð"]
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.all)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            if card.isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0.3)
            } else {
                shape
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
