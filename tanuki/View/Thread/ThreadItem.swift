//
//  ThreadItem.swift
//  tanuki
//
//  Created by a on 9/29/23.
//

import SwiftUI

struct Thread {
    var id: String
    var handleName: String?
    var date: String
    var body: String
}

struct ThreadItem: View {
    let item: Thread
    
    init (_ item: Thread) {
        self.item = item
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(item.id)
                    .bold()
                if let name = item.handleName {
                    Text(name)
                }
                Text(item.date)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(.init(item.body))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
}

#Preview {
    List {
        ForEach(280..<820) { index in
            ThreadItem(.init(id: "\(index)",
                             date: "2023/08/23",
                             body: """
[リンク](https://example.com)だよ[リンク](https://example.com)だよ[142](https://example.com)だよ
https://google.com
"""))
            .previewLayout(.sizeThatFits)
            .listRowInsets(EdgeInsets())
        }
    }
    .listStyle(.plain)
    .padding(0)
}
