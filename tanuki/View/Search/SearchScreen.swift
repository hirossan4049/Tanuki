//
//  SearchScreen.swift
//  tanuki
//
//  Created by a on 9/28/23.
//

import SwiftUI

enum SearchType: String, CaseIterable, Identifiable {
    case threads
    case threadsWithBody
    var id: Self { self }
    
    var title: String {
        switch self {
        case .threads:
            return "スレタイ"
        case .threadsWithBody:
            return "スレタイ+本文"
        }
    }
}

struct SearchScreen: View {
    @StateObject private var viewModel: SearchScreenViewModel
    
    @State private var currentTask: Task<(), Never>?
    
    @State var searchType: SearchType = .threads
    @State var threadTitleSearchText = ""
    @State var threadTitleWithBodySearchText = ""
    
    init() {
        self._viewModel = StateObject(wrappedValue: .init())
    }
    
    private var searchHeader: some View {
        VStack(spacing: 32) {
            Picker("スレタイ/本文", selection: $searchType) {
                ForEach(SearchType.allCases) { type in
                    Text(type.title)
                }
            }
            .pickerStyle(.segmented)
            
            
            if searchType == .threads {
                TextField("スレタイ", text: $threadTitleSearchText)
            } else if searchType == .threadsWithBody {
                TextField("スレタイ（任意）", text: $threadTitleSearchText)
                TextField("本文", text: $threadTitleWithBodySearchText)
            }
            
            Button(action: {
                currentTask?.cancel()
                
                currentTask = Task {
                    do {
                        try await viewModel.send(.searchThreads(title: threadTitleSearchText))
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
            }, label: {
                Text("検索")
            })
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                searchHeader
                    .padding()
                List {
                    if searchType == .threads {
                        ForEach(viewModel.uiState.threads, id: \.self) { item in
                            NavigationLink {
                                Text(item.url)
                            } label: {
                                Text(item.title)
                            }
                        }
                    } else if searchType == .threadsWithBody {
                        ForEach(viewModel.uiState.threadsWithBody, id: \.self) { item in
                            Text(item)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SearchScreen()
}
