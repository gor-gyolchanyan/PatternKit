//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension BidirectionalCollection {

    // Exposed

    // Type: TypeNameBidirectionalCollection
    // Topic: PredicateProtocol

    ///
    @inlinable
    public func difference<C, P>(from other: C, by areEquivalent: P) -> CollectionDifference<Element>
    where C: BidirectionalCollection, C.Element == Element, P: PredicateProtocol, P.Sample == (C.Element, Element) {
        difference(from: other, by: { areEquivalent.isMatching(($0, $1)) })
    }

    ///
    @inlinable
    public func last<P>(where predicate: P) -> Element?
    where P: PredicateProtocol, P.Sample == Element {
        last(where: predicate.isMatching(_:))
    }

    ///
    @inlinable
    public func lastIndex<P>(matching predicate: P) -> Index?
    where P: PredicateProtocol, P.Sample == Element {
        return lastIndex(where: predicate.isMatching(_:))
    }
}
