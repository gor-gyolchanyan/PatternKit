//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension RangeReplaceableCollection {

    // Exposed

    // Type: RangeReplaceableCollection
    // Topic: PredcateProtocol

    ///
    @inlinable
    public func filter<P>(_ isIncluded: P) -> Self
    where P: PredicateProtocol, P.Sample == Element {
        filter(isIncluded.isMatching(_:))
    }

    ///
    @inlinable
    public mutating func removeAll<P>(where shouldBeRemoved: P)
    where P: PredicateProtocol, P.Sample == Element {
        removeAll(where: shouldBeRemoved.isMatching(_:))
    }
}
