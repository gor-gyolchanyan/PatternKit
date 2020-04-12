//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Exposed

///
public protocol PredicateProtocol: PatternProtocol {

    // Exposed

    // Type: PredicateProtocol
    // Topic: Main

    ///
    func isMatching(_ sample: Sample) -> Bool
}

extension PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    ///
    @inlinable
    public func indexAfterMatching<S>(prefixOf samples: S) -> S.Index?
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
