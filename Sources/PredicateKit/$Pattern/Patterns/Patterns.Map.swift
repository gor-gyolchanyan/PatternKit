//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns {

    // Exposed

    // Type: Patterns
    // Topic: Map

    ///
    @frozen
    public struct Map<Pattern, Sample>
    where Pattern: PatternProtocol {

        // Exposed

        // Type: Patterns.Map
        // Topic: Main

        ///
        @inlinable
        public init(_ pattern: Pattern, mappedBy mappingFunction: @escaping (Sample) -> Pattern.Sample) {
            self.pattern = pattern
            self.mappingFunction = mappingFunction
        }

        ///
        public var pattern: Pattern

        ///
        public var mappingFunction: (Sample) -> Pattern.Sample
    }
}

extension Patterns.Map: PatternProtocol {

    // Exposed

    // Protocol: PatternProtocol
    // Topic: Main

    public func indexAfterMatching<S>(atStartIndexOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        let samples = samples.lazy.map(mappingFunction)
        return pattern.indexAfterMatching(atStartIndexOf: samples)
    }
}

extension PatternProtocol {

    // Exposed

    // Type: PatternProtocol
    // Topic: Map

    ///
    @inlinable
    public func map<S>(
        to otherSampleType: S.Type = S.self,
        _ mappingFunction: @escaping (S) -> Sample
    ) -> Patterns.Map<Self, S> {
        assert(otherSampleType == S.self)
        return .init(self, mappedBy: mappingFunction)
    }
}
