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

extension Predicates.EqualTo: Equatable {

    // Exposed

    // Protocol: Equatable
    // Topic: Equatable Requirements

    public static func == (_ some: Self, _ other: Self) -> Bool {
        some.sample == other.sample
    }
}

extension Predicates.EqualTo: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        sample == self.sample
    }
}

// Exposed

///
@inlinable
public func equalTo<S>(
    _ sample: S,
    as sampleType: S.Type = S.self
) -> Predicates.EqualTo<S> {
    assert(sampleType == S.self)
    return .init(sample)
}
