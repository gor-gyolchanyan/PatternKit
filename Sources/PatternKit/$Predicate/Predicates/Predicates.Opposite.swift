//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: Opposite

    ///
    @frozen
    public struct Opposite<Predicate>
    where Predicate: PredicateProtocol {

        // Exposed

        // Type: Predicates.Opposite
        // Topic: Main

        @inlinable
        init(_ predicate: Predicate) {
            self.predicate = predicate
        }

        @usableFromInline
        let predicate: Predicate
    }
}

extension Predicates.Opposite: PredicateProtocol {

    // Exposed

    // Type: PredicateProtocol
    // Topic: Main

    public typealias Sample = Predicate.Sample

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        !predicate.isMatching(sample)
    }
}

///
@inlinable
public prefix func ! <P>(_ predicate: P) -> Predicates.Opposite<P> {
    .init(predicate)
}
