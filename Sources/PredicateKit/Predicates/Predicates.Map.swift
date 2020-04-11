//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: Map

    ///
    @frozen
    public struct Map<Predicate, Sample>
    where Predicate: PredicateProtocol {

        // Exposed

        // Type: Predicates.Map
        // Topic: Main

        ///
        @inlinable
        public init(_ predicate: Predicate, mappedBy mappingFunction: @escaping (Sample) -> Predicate.Sample) {
            self.predicate = predicate
            self.mappingFunction = mappingFunction
        }

        ///
        public var predicate: Predicate

        ///
        public var mappingFunction: (Sample) -> Predicate.Sample
    }
}

extension Predicates.Map: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        predicate.isMatching(mappingFunction(sample))
    }
}

extension PredicateProtocol {

    // Exposed

    // Type: PredicateProtocol
    // Topic: Map

    ///
    @inlinable
    public func map<S>(
        to otherSampleType: S.Type = S.self,
        _ mappingFunction: @escaping (S) -> Sample
    ) -> Predicates.Map<Self, S> {
        assert(otherSampleType == S.self)
        return .init(self, mappedBy: mappingFunction)
    }
}
