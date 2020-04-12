//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns {

    // Exposed

    // Type: Patterns
    // Topic: MapFrom

    ///
    @frozen
    public struct Map<Pattern, Sample>
    where Pattern: PatternProtocol {

        // Concealed

        // Type: Patterns.MapFrom
        // Topic: Main

        @inlinable
        init(_ pattern: Pattern, mappedBy mappingFunction: @escaping (Sample) -> Pattern.Sample) {
            self.pattern = pattern
            self.mappingFunction = mappingFunction
        }

        @usableFromInline
        let pattern: Pattern

        @usableFromInline
        let mappingFunction: (Sample) -> Pattern.Sample
    }
}

extension Patterns.Map: PatternProtocol {

    // Exposed

    // Protocol: PatternProtocol
    // Topic: Main

    @inlinable
    public func indexAfterMatching<S>(prefixOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        let samples = samples.lazy.map(mappingFunction)
        return pattern.indexAfterMatching(prefixOf: samples)
    }
}

extension PatternProtocol {

    // Exposed

    // Type: PatternProtocol
    // Topic: MapFrom

    ///
    @inlinable
    public func map<S>(
        _ mappingFunction: @escaping (S) -> Sample
    ) -> Patterns.Map<Self, S> {
        .init(self, mappedBy: mappingFunction)
    }
}
