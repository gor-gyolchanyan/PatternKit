//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns {

    // Exposed

    // Type: Patterns
    // Topic: Or

    ///
    @frozen
    public struct Or<Pattern0, Pattern1>
    where Pattern0: PatternProtocol, Pattern1: PatternProtocol, Pattern1.Sample == Pattern0.Sample {

        // Concealed

        // Type: Patterns.Or
        // Topic: Main

        @inlinable
        init(_ pattern0: Pattern0, _ pattern1: Pattern1) {
            self.pattern = (pattern0, pattern1)
        }

        @usableFromInline
        let pattern: (Pattern0, Pattern1)
    }
}

extension Patterns.Or: PatternProtocol {

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

extension PatternProtocol {

    // Exposed

    // Type: PatternProtocol
    // Topic: Or

    ///
    @inlinable
    public static func | <O>(_ some: Self, _ other: O) -> Patterns.Or<Self, O> {
        .init(some, other)
    }
}
