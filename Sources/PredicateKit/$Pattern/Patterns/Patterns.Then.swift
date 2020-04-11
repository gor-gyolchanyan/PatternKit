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
    where Pattern0: PatternProtocol, Pattern1: PatternProtocol, Pattern0.Sample == Pattern1.Sample {

        // Exposed

        // Type: Patterns.Then
        // Topic: Main

        ///
        @inlinable
        public init(_ pattern0: Pattern0, _ pattern1: Pattern1) {
            self.pattern = (pattern0, pattern1)
        }

        ///
        public var pattern: (Pattern0, Pattern1)
    }
}


extension Patterns.Then: PatternProtocol {

    // Exposed

    // Protocol: PatternProtocol
    // Topic: Main

    public typealias Sample = Pattern0.Sample

    public func indexAfterMatching<S>(atStartIndexOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        guard
            let index0 = pattern.0.indexAfterMatching(atStartIndexOf: samples),
            let index1 = pattern.1.indexAfterMatching(atStartIndexOf: samples[index0...])
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
