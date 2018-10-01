//
//  StringExtensionTests.swift
//  NYTimesMostPopularTests
//
//  Created by Munadel Qubbaj on 10/1/18.
//  Copyright © 2018 Munadel Qubbaj. All rights reserved.
//

import XCTest

class StringExtensionTests: XCTestCase {

    func testConvertStringDateFormatWithValidFormat() {
        let dateString = "1988-03-19"
        let formattedDateString = dateString.convertStringDateFormat()

        XCTAssert(formattedDateString == "19-Mar-1988", "Convert date string should be in dd-mmm-YYYY")
    }

    func testConvertStringDateFormatWithInvalidFormat() {
        let dateString = "19-03-1988"
        let formattedDateString = dateString.convertStringDateFormat()

        XCTAssertFalse(formattedDateString == "19-Mar-1988", "Convert date string should be in dd-mmm-YYYY")
    }
}
