//
//  SettingsScreen.swift
//  tanuki
//
//  Created by a on 9/28/23.
//

import SwiftUI

struct SettingsScreen: View {
    var body: some View {
        List {
            Section {
                Text("developed by たこやき🐙")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    SettingsScreen()
}
