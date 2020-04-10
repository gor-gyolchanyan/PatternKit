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

extension Predicates.InRange: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    public typealias Sample = SampleRange.Bound

    @inlinable
    public func matches(_ sample: Sample) -> Bool {
        sampleRange.contains(sample)
    }
}

@inlinable
public func inRange<SampleRange>(
    _ sampleRange: SampleRange,
    as sampleType: SampleRange.Bound.Type = SampleRange.Bound.self
) -> Predicates.InRange<SampleRange> {
    assert(sampleType == SampleRange.Bound.self)
    return .init(sampleRange)
}
