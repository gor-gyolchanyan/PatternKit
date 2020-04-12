//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns {

    // Exposed

    // Type: Patterns
    // Topic: Repeating

    ///
    @frozen
    public struct Repeating<Pattern>
    where Pattern: PatternProtocol {

        // Concealed

        // Type: Patterns.Repeating
        // Topic: Main

        @inlinable
        init(_ pattern: Pattern, many: Many) {
            self.pattern = pattern
            self.many = many
        }

        @usableFromInline
        let pattern: Pattern

        @usableFromInline
        let many: Many
    }
}

extension Patterns.Repeating: PatternProtocol {

    // Exposed

    // Protocol: PatternProtocol
    // Topic: Main

    public typealias Sample = Pattern.Sample

    @inlinable
    public func indexAfterMatching<S>(prefixOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        many.reduce(samples.startIndex) { index in
            pattern.indexAfterMatching(prefixOf: samples[index...])
        }
    }
}

///
@inlinable
public func * <P>(_ pattern: P, _ many: Many) -> Patterns.Repeating<P>
where P: PatternProtocol {
    .init(pattern, many: many)
}

///
@inlinable
public func * <P>(_ many: Many, _ pattern: P) -> Patterns.Repeating<P>
where P: PatternProtocol {
    .init(pattern, many: many)
}
