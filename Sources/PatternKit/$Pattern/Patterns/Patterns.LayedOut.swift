//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns {

    // Exposed

    // Type: Patterns
    // Topic: LayedOut

    ///
    @frozen
    public struct LayedOut<Patterns>
    where Patterns: Collection, Patterns.Element: PatternProtocol {

        // Exposed

        // Type: Patterns.LayedOut
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

extension Patterns.LayedOut: PatternProtocol {

    // Exposed

    // Protocol: PatternProtocol
    // Topic: Main

    public typealias Sample = Patterns.Element.Sample

    public func indexAfterMatching<S>(atStartIndexOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        var sampleIndex = samples.startIndex
        for pattern in patterns {
            guard
                let nextSampleIndex = pattern.indexAfterMatching(atStartIndexOf: samples[sampleIndex...])
            else {
                return nil
            }
            sampleIndex = nextSampleIndex
        }
        return sampleIndex
    }
}

extension Collection
where Element: PatternProtocol {

    // Exposed

    // Type: Collection
    // Topic: PatternProtocol

    ///
    @inlinable
    public func layedOut() -> Patterns.LayedOut<Self> {
        .init(self)
    }
}

// Exposed

///
@inlinable
public func layedOut<P>(
    _ patterns: P...,
    as sampleType: P.Sample.Type = P.Sample.self
) -> Patterns.LayedOut<[P]> {
    assert(sampleType == P.Sample.self)
    return patterns.layedOut()
}
