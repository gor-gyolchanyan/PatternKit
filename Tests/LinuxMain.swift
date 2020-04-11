import XCTest

import PatternKit_Test

var testCaseEntrySet: [XCTestCaseEntry] {
    var result = [XCTestCaseEntry]()
    result.append(contentsOf: PatternKit_Test.testCaseEntrySet)
    return result
}

XCTMain(testCaseEntrySet)
