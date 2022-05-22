//
//  ContentView.swift
//  Memorize
//
//  Created by Usama Khan on 5/19/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = [
        ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"],
        ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🇺🇳", "🇺🇸", "🇨🇦", "🇬🇧", "🇵🇰", "🇮🇳", "🇨🇳", "🇯🇵", "🇰🇷", "🇦🇺", "🇪🇸", "🇿🇦", "🇶🇦", "🇸🇦", "🇳🇵", "🇲🇻", "🇹🇷", "🏳️‍🌈", "🏳️‍⚧️"],
        ["😀", "😆", "😂", "🥲", "😉", "😍", "🤪", "😎", "😒", "😭", "🤯", "😱", "🫠", "😬", "😴", "😵", "🤮", "😷", "🤠", "🤡", "💩", "👽", "🤖", "🎃"],
        ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐥", "🦆", "🦅", "🐙", "🦀", "🐟", "🦈", "🐊"]
    ]
    
    @State var theme = 0
    @State var emojiCount = 16
    @State var themeColor = Color.red
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.title)
                .foregroundColor(.blue)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[theme].shuffled()[0..<emojiCount], id: \.self) {
                        emoji in CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(themeColor)
            HStack {
                removeButton
                Spacer()
                themeSelector
                Spacer()
                addButton
            }
            .font(.largeTitle)
            .padding([.top, .leading, .trailing])
        }
        .padding(.horizontal)
    }
    
    var addButton: some View {
        Button {
            if emojiCount < emojis[theme].count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.rectangle.portrait")
        }
    }
    var removeButton: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.rectangle.portrait")
        }
    }
    var themeSelector: some View {
        Menu {
            Button {
                theme = 0
                emojiCount = Int.random(in: 4...16)
                themeColor = Color.red
            } label: {
                Label("Transportation", systemImage: "car")
            }
            Button {
                theme = 1
                emojiCount = Int.random(in: 4...16)
                themeColor = Color.purple
            } label: {
                Label("Flags", systemImage: "flag")
            }
            Button {
                theme = 2
                emojiCount = Int.random(in: 4...16)
                themeColor = Color.orange
            } label: {
                Label("Emotes", systemImage: "face.smiling")
            }
            Button {
                theme = 3
                emojiCount = Int.random(in: 4...16)
                themeColor = Color.green
            } label: {
                Label("Animals", systemImage: "hare")
            }
        } label: {
            Text("Themes")
        }
        .font(.title2)
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
