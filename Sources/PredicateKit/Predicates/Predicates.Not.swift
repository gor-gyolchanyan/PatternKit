//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: Not

    ///
    @frozen
    public struct Not<Predicate>
    where Predicate: PredicateProtocol {

        // Exposed

        // Type: Predicates.Not
        // Topic: Main

        ///
        @inlinable
        public init(_ predicate: Predicate) {
            self.predicate = predicate
        }

        ///
        public var predicate: Predicate
    }
}

extension Predicates.Not: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    public typealias Sample = Predicate.Sample

    @inlinable
    public func matches(_ sample: Sample) -> Bool {
        !predicate.matches(sample)
    }
}

extension PredicateProtocol {

    // Exposed

    // Type: PredicateProtocol
    // Topic: Not

    @inlinable
    public static prefix func ! (_ some: Self) -> Predicates.Not<Self> {
        .init(some)
    }
}
