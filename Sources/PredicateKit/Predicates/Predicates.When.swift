//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: When

    ///
    @frozen
    public struct When<Sample> {

        // Exposed

        // Type: Predicates.When
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

extension Predicates.When: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        matchingFunction(sample)
    }
}

// Exposed

///
@inlinable
public func when<S>(
    _ sampleType: S.Type = S.self,
    matchedBy matchingFunction: @escaping (S) -> Bool
) -> Predicates.When<S> {
    assert(sampleType == S.self)
    return .init(matchedBy: matchingFunction)
}
