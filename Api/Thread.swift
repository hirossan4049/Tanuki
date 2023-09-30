//
//  Thread.swift
//  Api
//
//  Created by a on 9/28/23.
//

import Foundation
import Alamofire
import Kanna

public protocol ThreadProtocol {
    func fetch(id: String) async
}

extension TanukiAPI.Thread: ThreadProtocol {
    public func fetch(id: String) async {
        let url = try! "".asURL()
    }
    public func thread(title: String) async -> [ThreadSearchResult] {
        let url = try! "https://b.2ch2.net/test/search.cgi?t=&bbs=zatsudan&guid=on&w=\(title)".asURL()
        
        guard let doc = try? HTML(url: url, encoding: .utf8) else { return [] }
        
        let threads = doc.css("a")
            .filter {
                $0["href"]?.contains("b.2ch2.net/test/read.cgi/zatsudan") ?? false
            }
            .compactMap {
                if let title = $0.text, let url = $0["href"] {
                    return ThreadSearchResult(title: title, url: url)
                } else {
                    return nil
                }
            }
        
        return threads
    }
}
