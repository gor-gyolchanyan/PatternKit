//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: RangeExpression

    ///
    @frozen
    public struct RangeExpression<Expectation>
    where Expectation: Swift.RangeExpression {

        // Exposed

        // Type: Predicates.RangeExpression
        // Topic: Main

        ///
        @inlinable
        public init(_ expectation: Expectation) {
            self.expectation = expectation
        }

        ///
        public var expectation: Expectation
    }
}

extension Predicates.RangeExpression: Equatable
where Expectation: Equatable {

    // Exposed

    // Protocol: Equatable
    // Topic: Equatable Requirements

    public static func == (_ some: Self, _ other: Self) -> Bool {
        some.expectation == other.expectation
    }
}

extension Predicates.RangeExpression: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    public typealias Sample = Expectation.Bound

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        expectation ~= sample
    }
}

extension Factory
where Sample: Comparable {

    // Exposed

    // Type: Factory
    // Topic: Main

    ///
    public typealias RangeExpression<E> = Predicates.RangeExpression<E>
    where E: Swift.RangeExpression, E.Bound == Sample

    ///
    public typealias PartialRangeFrom = RangeExpression<Swift.PartialRangeFrom<Sample>>

    ///
    public typealias PartialRangeUpTo = RangeExpression<Swift.PartialRangeUpTo<Sample>>

    ///
    public typealias PartialRangeThrough = Predicates.RangeExpression<Swift.PartialRangeThrough<Sample>>

    ///
    public typealias ClosedRange = Predicates.RangeExpression<Swift.ClosedRange<Sample>>

    ///
    public typealias Range = Predicates.RangeExpression<Swift.Range<Sample>>

    ///
    @inlinable
    public func callAsFunction<R>(_ rangeExpression: R) -> RangeExpression<R>
    where R: Swift.RangeExpression, R.Bound == Sample {
        .init(rangeExpression)
    }
}
