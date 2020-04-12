//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: Either

    ///
    @frozen
    public struct Either<Predicate0, Predicate1>
    where Predicate0: PredicateProtocol, Predicate1: PredicateProtocol, Predicate1.Sample == Predicate0.Sample {

        // Exposed

        // Type: Predicates.Either
        // Topic: Main

        @inlinable
        init(_ predicate0: Predicate0, _ predicate1: Predicate1) {
            predicate = (predicate0, predicate1)
        }

        @usableFromInline
        let predicate: (Predicate0, Predicate1)
    }
}

extension Predicates.Either: PredicateProtocol {

    // Exposed

    // Type: PredicateProtocol
    // Topic: Main

    public typealias Sample = Predicate0.Sample

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        predicate.0.isMatching(sample) || predicate.1.isMatching(sample)
    }
}

///
@inlinable
public func || <P0, P1>(_ predicate0: P0, predicate1: P1) -> Predicates.Either<P0, P1> {
    .init(predicate0, predicate1)
}
