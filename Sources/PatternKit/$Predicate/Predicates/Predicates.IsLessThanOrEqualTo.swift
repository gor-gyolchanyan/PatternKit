//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: IsLessThanOrEqualTo

    ///
    @frozen
    public struct IsLessThanOrEqualTo<Value>
    where Value: Comparable {

        // Exposed

        // Type: Predicates.IsLessThanOrEqualTo
        // Topic: Main

        @inlinable
        init(_ value: Value) {
            self.value = value
        }

        @usableFromInline
        let value: Value
    }
}

extension Predicates.IsLessThanOrEqualTo: PredicateProtocol {

    // Exposed

    // Type: PredicateProtocol
    // Topic: Main

    public typealias Sample = Value

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        sample <= value
    }
}

extension Comparable {

    // Exposed

    // Type: Equatable
    // Topic: Predicates.IsLessThanOrEqualTo

    ///
    @inlinable
    public static func <= (_ sample: Sample<Self>, _ value: Self) -> Predicates.IsLessThanOrEqualTo<Self> {
        .init(value)
    }

    ///
    @inlinable
    public static func >= (_ value: Self, _ sample: Sample<Self>) -> Predicates.IsLessThanOrEqualTo<Self> {
        sample <= value
    }
}
