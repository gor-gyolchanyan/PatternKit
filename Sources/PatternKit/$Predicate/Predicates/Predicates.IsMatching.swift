//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: IsMatching

    ///
    @frozen
    public struct IsMatching<Value> {

        // Concealed

        // Type: Predicates.IsMatching
        // Topic: Main

        @inlinable
        init(_ matchingFunction: @escaping (Value) -> Bool) {
            self.matchingFunction = matchingFunction
        }

        @usableFromInline
        let matchingFunction: (Value) -> Bool
    }
}

extension Predicates.IsMatching: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    public typealias Sample = Value

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        matchingFunction(sample)
    }
}

extension Sample {

    // Exposed

    // Type: Sample
    // Topic: Predicates.IsMatching

    ///
    @inlinable
    public func isMatching(_ matchingFunction: @escaping (Value) -> Bool) -> Predicates.IsMatching<Value> {
        .init(matchingFunction)
    }
}
