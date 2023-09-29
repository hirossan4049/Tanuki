//
//  RootScreen.swift
//  tanuki
//
//  Created by a on 9/28/23.
//

import SwiftUI

struct RootScreen: View {
    @State var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            HomeScreen()
                .tabItem { Label("ホーム", systemImage: "house") }
                .tag(1)
            SearchScreen()
                .tabItem { Label("検索", systemImage: "magnifyingglass") }
                .tag(2)
            SettingsScreen()
                .tabItem { Label("設定", systemImage: "gearshape") }
                .tag(2)
        }
    }
}

#Preview {
    RootScreen()
}
