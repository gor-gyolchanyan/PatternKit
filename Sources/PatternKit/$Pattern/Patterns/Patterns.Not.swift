//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns {

    // Exposed

    // Type: Patterns
    // Topic: Not

    ///
    @frozen
    public struct Not<Pattern>
    where Pattern: PatternProtocol {

        // Exposed

        // Type: Patterns.Not
        // Topic: Main

        ///
        @inlinable
        public init(_ pattern: Pattern) {
            self.pattern = pattern
        }

        ///
        public var pattern: Pattern
    }
}

extension Patterns.Not: PatternProtocol {

    // Exposed

    // Protocol: PatternProtocol
    // Topic: Main

    public typealias Sample = Pattern.Sample

    public func indexAfterMatching<S>(atStartIndexOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        guard
            pattern.indexAfterMatching(atStartIndexOf: samples) == nil
        else {
            return nil
        }
        return samples.startIndex
    }
}

extension PatternProtocol {

    // Exposed

    // Type: PatternProtocol
    // Topic: Not

    ///
    @inlinable
    public static prefix func ! (_ some: Self) -> Patterns.Not<Self> {
        .init(some)
    }
}
