//
//  ContentView.swift
//  Memorize
//
//  Created by Usama Khan on 5/19/22.
//

import SwiftUI

struct ContentView: View {
//    emojis:
//        vehicles = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
//        flags = ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🇺🇳", "🇺🇸", "🇨🇦", "🇬🇧", "🇵🇰", "🇮🇳", "🇨🇳", "🇯🇵", "🇰🇷", "🇦🇺", "🇪🇸", "🇿🇦", "🇶🇦", "🇸🇦", "🇳🇵", "🇲🇻", "🇹🇷", "🏳️‍🌈", "🏳️‍⚧️"]
//        emotes = ["😀", "😆", "😂", "🥲", "😉", "😍", "🤪", "😎", "😒", "😭", "🤯", "😱", "🫠", "😬", "😴", "😵", "🤮", "😷", "🤠", "🤡", "💩", "👽", "🤖", "🎃"]
//        animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐥", "🦆", "🦅", "🐙", "🦀", "🐟", "🦈", "🐊"]
    
    var emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    @State var emojiCount = 20
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) {
                        emoji in CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
        }
        .padding(.all)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            let card = RoundedRectangle(cornerRadius: 10)
            if isFaceUp {
                card.fill(.white)
                card.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                card
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
