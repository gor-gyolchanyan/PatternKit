//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Sequence {

    // Exposed

    // Type: Sequence
    // Topic: PredicateProtocol

    ///
    @inlinable
    public func contains<P>(where predicate: P) -> Bool
    where P: PredicateProtocol, P.Sample == Element {
        contains(where: predicate.isMatching(_:))
    }

    ///
    @inlinable
    public func first<P>(where predicate: P) -> Element?
    where P: PredicateProtocol, P.Sample == Element {
        first(where: predicate.isMatching(_:))
    }

    ///
    @inlinable
    public func min<P>(by areInIncreasingOrder: P) -> Element?
    where P: PredicateProtocol, P.Sample == (Element, Element) {
        self.min(by: { areInIncreasingOrder.isMatching(($0, $1)) })
    }

    ///
    @inlinable
    public func max<P>(by areInIncreasingOrder: P) -> Element?
    where P: PredicateProtocol, P.Sample == (Element, Element) {
        self.max(by: { areInIncreasingOrder.isMatching(($0, $1)) })
    }

    ///
    @inlinable
    public func sorted<P>(by areInIncreasingOrder: P) -> [Self.Element]
    where P: PredicateProtocol, P.Sample == (Element, Element) {
        sorted(by: { areInIncreasingOrder.isMatching(($0, $1)) })
    }

    ///
    @inlinable
    public func lexicographicallyPrecedes<O, P>(_ other: O, by areInIncreasingOrder: P) -> Bool
    where O: Sequence, O.Element == Element, P: PredicateProtocol, P.Sample == (Element, Element) {
        lexicographicallyPrecedes(other, by: { areInIncreasingOrder.isMatching(($0, $1)) })
    }

    ///
    @inlinable
    public func allSatisfy<P>(_ predicate: P) -> Bool
    where P: PredicateProtocol, P.Sample == Element {
        allSatisfy(predicate.isMatching(_:))
    }

    ///
    @inlinable
    public func drop<P>(while predicate: P) -> DropWhileSequence<Self>
    where P: PredicateProtocol, P.Sample == Element {
        drop(while: predicate.isMatching(_:))
    }

    ///
    @inlinable
    public func filter<P>(_ isIncluded: P) -> [Element]
    where P: PredicateProtocol, P.Sample == Element {
        filter(isIncluded.isMatching(_:))
    }

    ///
    @inlinable
    public func prefix<P>(while predicate: P) -> [Element]
    where P: PredicateProtocol, P.Sample == Element {
        prefix(while: predicate.isMatching(_:))
    }

    ///
    @inlinable
    public func split<P>(maxSplits: Int = Int.max, omittingEmptySubsequences: Bool = true, whereSeparator isSeparator: P) -> [ArraySlice<Element>]
    where P: PredicateProtocol, P.Sample == Element {
        split(maxSplits: maxSplits, omittingEmptySubsequences: omittingEmptySubsequences, whereSeparator: isSeparator.isMatching(_:))
    }

    ///
    @inlinable
    public func starts<O, P>(with other: O, by areEquivalent: P) -> Bool
    where O: Sequence, P: PredicateProtocol, P.Sample == (Element, O.Element) {
        starts(with: other, by: { areEquivalent.isMatching(($0, $1)) })
    }
}
