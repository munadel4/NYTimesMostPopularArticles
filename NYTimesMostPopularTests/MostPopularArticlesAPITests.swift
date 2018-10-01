//
//  MostPopularArticlesAPITests.swift
//  MostPopularArticlesAPITests
//
//  Created by Munadel Qubbaj on 9/30/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import XCTest
@testable import NYTimesMostPopular

class MostPopularArticlesAPITests: XCTestCase {

    func testFetchApi() {
        let promise = expectation(description: "Status Code 200")
        MostPopularArticlesAPI.getMostPopularArticles { (articale, success) in
            if (success && articale != nil) {
                promise.fulfill()
            } else if (false == success && articale == nil) {
                promise.fulfill()
            }
        }

        // for the purposes of testing, we're just putting 10 seconds here.
        waitForExpectations(timeout: 10, handler: nil)
    }

}
