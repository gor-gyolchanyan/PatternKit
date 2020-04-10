import XCTest

import PredicateKit_Test

var testCaseEntrySet: [XCTestCaseEntry] {
    var result = [XCTestCaseEntry]()
    result.append(contentsOf: PredicateKit_Test.testCaseEntrySet)
    return result
}

XCTMain(testCaseEntrySet)
