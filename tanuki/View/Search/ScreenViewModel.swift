//
//  SearchViewModel.swift
//  tanuki
//
//  Created by a on 9/29/23.
//

import Foundation
import Api

// MARK: UIState
extension SearchScreenViewModel.UiState {
}

// MARK: Error
enum SearchScreenError: LocalizedError {
    case titleEmpty
    case bodyEmpty
    
    var errorDescription: String? {
        switch self {
        case .titleEmpty: return "スレタイを入力してください"
        case .bodyEmpty: return "本文を入力してください"
        }
    }
}

// MARK: ViewModel
@MainActor
final class SearchScreenViewModel: ObservableObject {
    @Published private(set) var uiState: UiState
    
    struct UiState {
        var threads: [ThreadSearchResult] = []
        var threadsWithBody: [String] = []
    }
    
    enum Action {
        case searchThreads(title: String)
        case searchThreadsWithBody(title: String, body: String)
    }
    
    init() {
        self.uiState = UiState()
    }
    
    func send(_ action: Action) async throws {
        try action.validation()
        
        switch action {
        case let .searchThreads(title: title):
            print(title)
            uiState.threads = await TanukiAPI.Search().thread(title: title)
        case let .searchThreadsWithBody(title: title, body: body):
            print(title, body)
        }
    }

}

// MARK: Action Extension
extension SearchScreenViewModel.Action {
    func validation() throws {
        switch self {
        case let .searchThreads(title: title):
            if title == "" {
                throw SearchScreenError.titleEmpty
            }
        case let .searchThreadsWithBody(title: _, body: body):
            if body == "" {
                throw SearchScreenError.bodyEmpty
            }
        }
    }
}
