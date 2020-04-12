//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: AllOf

    public typealias AllOf<P> = Patterns.AllOf<P>
    where P: Collection, P.Element: PredicateProtocol
}

extension Predicates.AllOf: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        for pattern in patterns {
            if !pattern.isMatching(sample) {
                return false
            }
        }
        return true
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
