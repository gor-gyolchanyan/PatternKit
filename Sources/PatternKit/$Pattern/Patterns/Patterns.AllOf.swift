//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns {

    // Exposed

    // Type: Patterns
    // Topic: AllOf

    ///
    @frozen
    public struct AllOf<Patterns>
    where Patterns: Collection, Patterns.Element: PatternProtocol {

        // Exposed

        // Type: Patterns.AllOf
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

extension Patterns.AllOf: PatternProtocol {

    // Exposed

    // Protocol: PatternProtocol
    // Topic: Main

    public typealias Sample = Patterns.Element.Sample

    public func indexAfterMatching<S>(atStartIndexOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        var patterns = self.patterns[...]
        var index: S.Index
        if let firstPattern = patterns.popFirst() {
            guard
                let firstIndex = firstPattern.indexAfterMatching(atStartIndexOf: samples)
            else {
                return nil
            }
            index = firstIndex
        } else {
            return samples.startIndex
        }
        while let nextPattern = patterns.popFirst() {
            guard
                let nextIndex = nextPattern.indexAfterMatching(atStartIndexOf: samples)
            else {
                return nil
            }
            index = min(index, nextIndex)
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
    public func allOf() -> Patterns.AllOf<Self> {
        .init(self)
    }
}

// Exposed

///
@inlinable
public func allOf<P>(
    _ patterns: P...,
    as sampleType: P.Sample.Type = P.Sample.self
) -> Patterns.AllOf<[P]> {
    assert(sampleType == P.Sample.self)
    return patterns.allOf()
}
