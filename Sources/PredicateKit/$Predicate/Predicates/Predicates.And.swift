//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: And

    ///
    @frozen
    public struct And<Predicate0, Predicate1>
    where Predicate0: PredicateProtocol, Predicate1: PredicateProtocol, Predicate0.Sample == Predicate1.Sample {

        // Exposed

        // Type: Predicates.And
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

extension Predicates.And: Equatable
where Predicate0: Equatable, Predicate1: Equatable {

    // Exposed

    // Protocol: Equatable
    // Topic: Equatable Requirements

    public static func == (_ some: Self, _ other: Self) -> Bool {
        some.predicate == other.predicate
    }
}

extension Predicates.And: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    public typealias Sample = Predicate0.Sample

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        predicate.0.isMatching(sample) && predicate.1.isMatching(sample)
    }
}

extension PredicateProtocol {

    // Exposed

    // Type: PredicateProtocol
    // Topic: And

    ///
    @inlinable
    public static func && <O>(_ some: Self, _ other: O) -> Predicates.And<Self, O> {
        .init(some, other)
    }
}
