//
//  ApiTests.swift
//  ApiTests
//
//  Created by a on 9/28/23.
//

import XCTest
@testable import Api

final class ApiTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testスレタイ検索_検索結果なし() async throws {
        let res = await TanukiAPI.Search().thread(title: "Ipsum mollit incididunt")
        XCTAssertEqual(res, [])
    }

}
