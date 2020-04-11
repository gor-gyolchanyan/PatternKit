//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: InRange

    ///
    @frozen
    public struct InRange<SampleRange>
    where SampleRange: RangeExpression {

        // Exposed

        // Type: Predicates.InRange
        // Topic: Main

        ///
        @inlinable
        public init(_ sampleRange: SampleRange) {
            self.sampleRange = sampleRange
        }

        ///
        public var sampleRange: SampleRange
    }
}

extension Predicates.InRange: Equatable
where SampleRange: Equatable {

    // Exposed

    // Protocol: Equatable
    // Topic: Equatable Requirements

    public static func == (_ some: Self, _ other: Self) -> Bool {
        some.sampleRange == other.sampleRange
    }
}

extension Predicates.InRange: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    public typealias Sample = SampleRange.Bound

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        sampleRange.contains(sample)
    }
}

// Exposed

///
@inlinable
public func inRange<S>(
    _ sampleRange: S,
    as sampleType: S.Bound.Type = S.Bound.self
) -> Predicates.InRange<S> {
    assert(sampleType == S.Bound.self)
    return .init(sampleRange)
}
