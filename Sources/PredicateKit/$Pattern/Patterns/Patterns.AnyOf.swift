//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns {

    // Exposed

    // Type: Patterns
    // Topic: AnyOf

    ///
    @frozen
    public struct AnyOf<Patterns>
    where Patterns: Collection, Patterns.Element: PatternProtocol {

        // Exposed

        // Type: Patterns.AnyOf
        // Topic: Main

        ///
        @inlinable
        public init(_ patterns: Patterns) {
            self.patterns = patterns
        }

        ///
        public var patterns: Patterns
    }
}

extension Patterns.AnyOf: PatternProtocol {

    // Exposed

    // Protocol: PatternProtocol
    // Topic: Main

    public typealias Sample = Patterns.Element.Sample

    public func indexAfterMatching<S>(atStartIndexOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        var patterns = self.patterns[...]
        guard !patterns.isEmpty else {
            return samples.startIndex
        }
        var index: S.Index? = nil
        while
            let nextPattern = patterns.popFirst(),
            let nextIndex = nextPattern.indexAfterMatching(atStartIndexOf: samples)
        {
            if let previousIndex = index {
                index = max(previousIndex, nextIndex)
            } else {
                index = nextIndex
            }
        }
        return index
    }
}

extension Collection
where Element: PatternProtocol {

    // Exposed

    // Type: Collection
    // Topic: PatternProtocol

    ///
    @inlinable
    public func anyOf() -> Patterns.AnyOf<Self> {
        .init(self)
    }
}

// Exposed

///
@inlinable
public func anyOf<P>(
    _ patterns: P...,
    as sampleType: P.Sample.Type = P.Sample.self
) -> Patterns.AnyOf<[P]> {
    assert(sampleType == P.Sample.self)
    return patterns.anyOf()
}
