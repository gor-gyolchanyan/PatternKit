//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: Equatable

    ///
    @frozen
    public struct Equatable<Expectation>
    where Expectation: Swift.Equatable {

        // Exposed

        // Type: Predicates.Equatable
        // Topic: Main

        ///
        @inlinable
        public init(_ expectation: Expectation) {
            self.expectation = expectation
        }

        ///
        public var expectation: Expectation
    }
}

extension Predicates.Equatable: Equatable {

    // Exposed

    // Protocol: Equatable
    // Topic: Equatable Requirements

    public static func == (_ some: Self, _ other: Self) -> Bool {
        some.expectation == other.expectation
    }
}

extension Predicates.Equatable: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    public typealias Sample = Expectation

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        expectation ~= sample
    }
}

extension Factory
where Sample: Swift.Equatable {

    // Exposed

    // Type: Factory
    // Topic: Main

    ///
    public typealias Equatable = Predicates.Equatable<Sample>

    ///
    @inlinable
    public func callAsFunction(_ sample: Sample) -> Equatable {
        .init(sample)
    }
}
