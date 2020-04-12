//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Exposed


extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: EqualTo

    ///
    @frozen
    public struct EqualTo<Value>
    where Value: Equatable {

        // Exposed

        // Type: Predicates.EqualTo
        // Topic: Main

        @inlinable
        init(_ value: Value) {
            self.value = value
        }

        @usableFromInline
        let value: Value
    }
}

extension Predicates.EqualTo: PredicateProtocol {

    // Exposed

    // Type: PredicateProtocol
    // Topic: Main

    public typealias Sample = Value

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        sample == value
    }
}

extension Equatable {

    // Exposed

    // Type: Equatable
    // Topic: Predicates.EqualTo

    ///
    @inlinable
    public static func == (_ sample: Sample<Self>, _ value: Self) -> Predicates.EqualTo<Self> {
        .init(value)
    }

    ///
    @inlinable
    public static func == (_ value: Self, _ sample: Sample<Self>) -> Predicates.EqualTo<Self> {
        sample == value
    }
}
