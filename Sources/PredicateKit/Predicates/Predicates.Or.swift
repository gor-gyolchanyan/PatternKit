//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: Or

    ///
    @frozen
    public struct Or<Predicate0, Predicate1>
    where Predicate0: PredicateProtocol, Predicate1: PredicateProtocol, Predicate0.Sample == Predicate1.Sample {

        // Exposed

        // Type: Predicates.Or
        // Topic: Main

        ///
        @inlinable
        public init(_ predicate0: Predicate0, _ predicate1: Predicate1) {
            self.predicate = (predicate0, predicate1)
        }

        ///
        public var predicate: (Predicate0, Predicate1)
    }
}

extension Predicates.Or: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    public typealias Sample = Predicate0.Sample

    @inlinable
    public func matches(_ sample: Sample) -> Bool {
        predicate.0.matches(sample) && predicate.1.matches(sample)
    }
}

extension PredicateProtocol {

    // Exposed

    // Type: PredicateProtocol
    // Topic: Or

    @inlinable
    public static func || <Other>(_ some: Self, _ other: Other) -> Predicates.Or<Self, Other> {
        .init(some, other)
    }
}
