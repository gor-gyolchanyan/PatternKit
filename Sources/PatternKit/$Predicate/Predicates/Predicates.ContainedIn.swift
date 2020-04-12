//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: ContainedIn

    public struct ContainedIn<ValueRange>
    where ValueRange: RangeExpression {

        // Exposed

        // Type: Predicates.ContainedIn
        // Topic: Main

        @inlinable
        init(_ valueRange: ValueRange) {
            self.valueRange = valueRange
        }

        @usableFromInline
        let valueRange: ValueRange
    }
}

extension Predicates.ContainedIn: PredicateProtocol {

    // Exposed

    // Type: PredicateProtocol
    // Topic: Main

    public typealias Sample = ValueRange.Bound

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        valueRange.contains(sample)
    }
}

extension Sample
where Value: Comparable {

    // Exposed

    // Type: Sample
    // Topic: Predicates.ContainedIn

    ///
    @inlinable
    public func isContained<C>(in constant: C) -> Predicates.ContainedIn<C>
    where C: RangeExpression, C.Bound == Value {
        .init(constant)
    }
}

extension RangeExpression {

    // Exposed

    // Type: RangeExpression
    // Topic: Predicates.ContainedIn

    ///
    @inlinable
    public func contains(_ sample: Sample<Bound>) -> Predicates.ContainedIn<Self> {
        sample.isContained(in: self)
    }
}
