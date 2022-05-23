//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Usama Khan on 5/19/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
