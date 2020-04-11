//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension LazySequenceProtocol {

    // Exposed

    // Type: LazySequenceProtocol
    // Topic: PredicateProtocol

    ///
    @inlinable
    public func drop<P>(while predicate: P) -> LazyDropWhileSequence<Elements>
    where P: PredicateProtocol, P.Sample == Element {
        drop(while: predicate.isMatching(_:))
    }

    ///
    @inlinable
    public func filter<P>(_ isIncluded: P) -> LazyFilterSequence<Elements>
    where P: PredicateProtocol, P.Sample == Element {
        filter(isIncluded.isMatching(_:))
    }

    ///
    @inlinable
    public func prefix<P>(while predicate: P) -> LazyPrefixWhileSequence<Elements>
    where P: PredicateProtocol, P.Sample == Element {
        prefix(while: predicate.isMatching(_:))
    }
}
