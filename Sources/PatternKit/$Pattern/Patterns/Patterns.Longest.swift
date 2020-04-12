//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns {

    // Exposed

    // Type: Patterns
    // Topic: Longest

    ///
    @frozen
    public struct Longest<Pattern0, Pattern1>
    where Pattern0: PatternProtocol, Pattern1: PatternProtocol, Pattern1.Sample == Pattern0.Sample {

        // Exposed

        // Type: Patterns.Longest
        // Topic: Main

        @inlinable
        init(_ pattern0: Pattern0, _ pattern1: Pattern1) {
            pattern = (pattern0, pattern1)
        }

        @usableFromInline
        let pattern: (Pattern0, Pattern1)
    }
}

extension Patterns.Longest: PatternProtocol {

    // Exposed

    // Protocol: PatternProtocol
    // Topic: Main

    public typealias Sample = Pattern0.Sample

    @inlinable
    public func indexAfterMatching<S>(prefixOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        let theIndex0 = pattern.0.indexAfterMatching(prefixOf: samples)
        let theIndex1 = pattern.1.indexAfterMatching(prefixOf: samples)
        guard let index0 = theIndex0 else { return theIndex1 }
        guard let index1 = theIndex1 else { return theIndex0 }
        return max(index0, index1)
    }
}

///
@inlinable
public func | <P0, P1>(_ pattern0: P0, pattern1: P1) -> Patterns.Longest<P0, P1> {
    .init(pattern0, pattern1)
}
