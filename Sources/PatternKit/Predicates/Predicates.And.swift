//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: And

    public typealias And<P0, P1> = Patterns.And<P0, P1>
    where P0: PredicateProtocol, P1: PredicateProtocol, P1.Sample == P0.Sample
}

extension Predicates.And: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        pattern.0.isMatching(sample) && pattern.1.isMatching(sample)
    }

    // Protocol: PatternProtocol
    // Topic: Main

    @inlinable
    public func indexAfterMatching<S>(atStartIndexOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        guard
            let sample = samples.first,
            isMatching(sample)
        else {
            return nil
        }
        return samples.index(after: samples.startIndex)
    }
}
