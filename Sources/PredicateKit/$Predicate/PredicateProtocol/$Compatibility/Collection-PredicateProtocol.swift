//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Collection {

    // Exposed

    // Type: Collection
    // Topic: PredcateProtocol

    ///
    @inlinable
    public func drop<P>(while predicate: P) -> SubSequence
    where P: PredicateProtocol, P.Sample == Element {
        drop(while: predicate.isMatching(_:))
    }

    ///
    @inlinable
    public func firstIndex<P>(matching predicate: P) -> Index?
    where P: PredicateProtocol, P.Sample == Element {
        firstIndex(where: predicate.isMatching(_:))
    }

    ///
    @inlinable
    public func prefix<P>(while predicate: P) -> SubSequence
    where P: PredicateProtocol, P.Sample == Element {
        prefix(while: predicate.isMatching(_:))
    }

    ///
    @inlinable
    public func split<P>(maxSplits: Int = Int.max, omittingEmptySubsequences: Bool = true, whereSeparator isSeparator: P) -> [SubSequence]
    where P: PredicateProtocol, P.Sample == Element {
        split(maxSplits: maxSplits, omittingEmptySubsequences: omittingEmptySubsequences, whereSeparator: isSeparator.isMatching(_:))
    }
}
