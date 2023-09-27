//
//  ContentView.swift
//  tanuki
//
//  Created by a on 9/28/23.
//

import SwiftUI
import Api

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task() {
            let api = await TanukiAPI.Search().thread(title: "にじさんじ")
        }
    }
}

#Preview {
    ContentView()
}
