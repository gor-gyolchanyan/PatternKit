//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns {

    // Exposed

    // Type: Patterns
    // Topic: Then

    ///
    @frozen
    public struct Then<Pattern0, Pattern1>
    where Pattern0: PatternProtocol, Pattern1: PatternProtocol, Pattern1.Sample == Pattern0.Sample {

        // Concealed

        // Type: Patterns.Then
        // Topic: Main

        @inlinable
        init(_ pattern0: Pattern0, _ pattern1: Pattern1) {
            self.pattern = (pattern0, pattern1)
        }

        @usableFromInline
        let pattern: (Pattern0, Pattern1)
    }
}


extension Patterns.Then: PatternProtocol {

    // Exposed

    // Protocol: PatternProtocol
    // Topic: Main

    public typealias Sample = Pattern0.Sample

    @inlinable
    public func indexAfterMatching<S>(prefixOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        guard
            let index0 = pattern.0.indexAfterMatching(prefixOf: samples),
            let index1 = pattern.1.indexAfterMatching(prefixOf: samples[index0...])
        else {
            return nil
        }
        return index1
    }
}

extension PatternProtocol {

    // Exposed

    // Type: PatternProtocol
    // Topic: Then

    ///
    @inlinable
    public static func + <O>(_ some: Self, _ other: O) -> Patterns.Then<Self, O> {
        .init(some, other)
    }
}
