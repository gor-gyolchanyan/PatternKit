//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//


extension MutableCollection {

    // Exposed

    // Type: MutableCollection
    // Topic: PredcateProtocol

    ///
    @inlinable
    public mutating func partition<P>(by belongsInSecondPartition: P) -> Index
    where P: PredicateProtocol, P.Sample == Element {
        partition(by: belongsInSecondPartition.isMatching(_:))
    }

}

extension MutableCollection
where Self: RandomAccessCollection {

    // Exposed

    // Type: MutableCollection
    // Topic: PredcateProtocol

    ///
    @inlinable
    public mutating func sort<P>(by areInIncreasingOrder: P)
    where P: PredicateProtocol, P.Sample == (Element, Element) {
        sort(by: { areInIncreasingOrder.isMatching(($0, $1)) })
    }
}
