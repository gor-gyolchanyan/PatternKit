//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: Function

    ///
    @frozen
    public struct Function<Sample> {

        // Exposed

        // Type: Predicates.Function
        // Topic: Main

        ///
        @inlinable
        public init(matchedBy matchingFunction: @escaping (Sample) -> Bool) {
            self.matchingFunction = matchingFunction
        }

        ///
        public var matchingFunction: (Sample) -> Bool
    }
}

extension Predicates.Function: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        matchingFunction(sample)
    }
}

extension Factory {

    // Exposed

    // Type: Factory
    // Topic: Main

    ///
    public typealias Function = Predicates.Function<Sample>

    ///
    @inlinable
    public func callAsFunction(_ matchingFunction: @escaping (Sample) -> Bool) -> Function {
        .init(matchedBy: matchingFunction)
    }
}
