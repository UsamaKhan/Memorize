//
//  ContentView.swift
//  Memorize
//
//  Created by Usama Khan on 5/19/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
            Text("Hello, world!")
        }
        .padding()
        .foregroundColor(.red)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
