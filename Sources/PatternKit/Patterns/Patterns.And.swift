//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns {

    // Exposed

    // Type: Patterns
    // Topic: And

    ///
    @frozen
    public struct And<Pattern0, Pattern1>
    where Pattern0: PatternProtocol, Pattern1: PatternProtocol, Pattern1.Sample == Pattern0.Sample {

        // Concealed

        // Type: Patterns.And
        // Topic: Main

        @inlinable
        init(_ pattern0: Pattern0, _ pattern1: Pattern1) {
            self.pattern = (pattern0, pattern1)
        }

        @usableFromInline
        let pattern: (Pattern0, Pattern1)
    }
}

extension Patterns.And: PatternProtocol {

    // Exposed

    // Protocol: PatternProtocol
    // Topic: Main

    public typealias Sample = Pattern0.Sample

    @inlinable
    public func indexAfterMatching<S>(prefixOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        guard
            let index0 = pattern.0.indexAfterMatching(prefixOf: samples),
            let index1 = pattern.1.indexAfterMatching(prefixOf: samples),
            index0 == index1
        else {
            return nil
        }
        return index0
    }
}

extension PatternProtocol {

    // Exposed

    // Type: PatternProtocol
    // Topic: And

    ///
    @inlinable
    public static func & <O>(_ some: Self, _ other: O) -> Patterns.And<Self, O> {
        .init(some, other)
    }
}
