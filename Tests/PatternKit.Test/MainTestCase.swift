import XCTest
@testable import PatternKit

// Type: MainTestCase

final class MainTestCase: XCTestCase { }

// Topic: Main

extension MainTestCase {

    static let entrySet = [
        ("testStandardPredicates", testStandardPredicates),
        ("testAnyPredicate", testAnyPredicate),
        ("testStandardPatterns", testStandardPatterns),
    ]

    func testStandardPredicates() {
        let isPositive = when { $0 > 0 }
        XCTAssertFalse(isPositive.isMatching(-2))
        XCTAssertFalse(isPositive.isMatching(-1))
        XCTAssertFalse(isPositive.isMatching(0))
        XCTAssertTrue(isPositive.isMatching(1))
        XCTAssertTrue(isPositive.isMatching(2))

        let isNegative = inRange(..<0)
        XCTAssertTrue(isNegative.isMatching(-2))
        XCTAssertTrue(isNegative.isMatching(-1))
        XCTAssertFalse(isNegative.isMatching(0))
        XCTAssertFalse(isNegative.isMatching(1))
        XCTAssertFalse(isNegative.isMatching(2))

        let isZero = equalTo(0)
        XCTAssertFalse(isZero.isMatching(-2))
        XCTAssertFalse(isZero.isMatching(-1))
        XCTAssertTrue(isZero.isMatching(0))
        XCTAssertFalse(isZero.isMatching(1))
        XCTAssertFalse(isZero.isMatching(2))

        let isNonZero = !isZero
        XCTAssertTrue(isNonZero.isMatching(-2))
        XCTAssertTrue(isNonZero.isMatching(-1))
        XCTAssertFalse(isNonZero.isMatching(0))
        XCTAssertTrue(isNonZero.isMatching(1))
        XCTAssertTrue(isNonZero.isMatching(2))

        let isEven = when(Int.self) { $0.isMultiple(of: 2) }
        let isPositiveAndEven = isPositive && isEven
        XCTAssertFalse(isPositiveAndEven.isMatching(-2))
        XCTAssertFalse(isPositiveAndEven.isMatching(-1))
        XCTAssertFalse(isPositiveAndEven.isMatching(0))
        XCTAssertFalse(isPositiveAndEven.isMatching(1))
        XCTAssertTrue(isPositiveAndEven.isMatching(2))

        let isPositiveOrEven = isPositive || isEven
        XCTAssertTrue(isPositiveOrEven.isMatching(-2))
        XCTAssertFalse(isPositiveOrEven.isMatching(-1))
        XCTAssertTrue(isPositiveOrEven.isMatching(0))
        XCTAssertTrue(isPositiveOrEven.isMatching(1))
        XCTAssertTrue(isPositiveOrEven.isMatching(2))

        let isZeroString = isZero.map(to: String.self) { Int($0)! }
        XCTAssertFalse(isZeroString.isMatching("-2"))
        XCTAssertFalse(isZeroString.isMatching("-1"))
        XCTAssertTrue(isZeroString.isMatching("0"))
        XCTAssertFalse(isZeroString.isMatching("1"))
        XCTAssertFalse(isZeroString.isMatching("2"))

        let isASCII = the(\.isASCII)
        let isAlphabetic = the(\.isAlphabetic)
        let isASCIIAndAlphabetic = allOf(isASCII, isAlphabetic)
        XCTAssertTrue(isASCIIAndAlphabetic.isMatching("f"))
        XCTAssertFalse(isASCIIAndAlphabetic.isMatching("!"))
        XCTAssertFalse(isASCIIAndAlphabetic.isMatching("é"))
        XCTAssertFalse(isASCIIAndAlphabetic.isMatching("¡"))

        let isWhitespace = the(\.isWhitespace)
        let isAlphabeticOrIsWhitespace = anyOf(isAlphabetic, isWhitespace)
        XCTAssertTrue(isAlphabeticOrIsWhitespace.isMatching("f"))
        XCTAssertTrue(isAlphabeticOrIsWhitespace.isMatching(" "))
        XCTAssertFalse(isAlphabeticOrIsWhitespace.isMatching("!"))
        XCTAssertTrue(isAlphabeticOrIsWhitespace.isMatching("é"))
    }

    func testAnyPredicate() {
        let isZero = equalTo(Int.zero)
        let anyPredicate = isZero.asAny()
        XCTAssertEqual(anyPredicate.underlying as! Predicates.EqualTo<Int>, isZero)
        XCTAssertFalse(anyPredicate.isMatching(-1))
        XCTAssertTrue(anyPredicate.isMatching(0))
        XCTAssertFalse(anyPredicate.isMatching(1))
    }

    func testStandardPatterns() {
        let numbers = [2, 4, 3 , 1, 8, 5]

        let manyEven =
            when(Int.self) { $0.isMultiple(of: 2) }
            .many()
        XCTAssert(numbers.prefix(matching: manyEven) == [2, 4])
    }
}
