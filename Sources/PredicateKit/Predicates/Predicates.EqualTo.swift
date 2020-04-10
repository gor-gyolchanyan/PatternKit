//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: EqualTo

    ///
    @frozen
    public struct EqualTo<Sample>
    where Sample: Equatable {

        // Exposed

        // Type: Predicates.EqualTo
        // Topic: Main

        ///
        @inlinable
        public init(_ sample: Sample) {
            self.sample = sample
        }

        ///
        public var sample: Sample
    }
}

extension Predicates.EqualTo: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    @inlinable
    public func matches(_ sample: Sample) -> Bool {
        sample == self.sample
    }
}

@inlinable
public func equalTo<Sample>(
    _ sample: Sample,
    as sampleType: Sample.Type = Sample.self
) -> Predicates.EqualTo<Sample> {
    assert(sampleType == Sample.self)
    return .init(sample)
}
