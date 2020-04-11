//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: AllOf

    ///
    @frozen
    public struct AllOf<Predicates>
    where Predicates: Collection, Predicates.Element: PredicateProtocol {

        // Exposed

        // Type: Predicates.AllOf
        // Topic: Main

        ///
        @inlinable
        public init(_ predicates: Predicates) {
            self.predicates = predicates
        }

        ///
        public var predicates: Predicates
    }
}

extension Predicates.AllOf: Equatable
where Predicates: Equatable {

    // Exposed

    // Protocol: Equatable
    // Topic: Equatable Requirements

    public static func == (_ some: Self, _ other: Self) -> Bool {
        some.predicates == other.predicates
    }
}

extension Predicates.AllOf: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    public typealias Sample = Predicates.Element.Sample

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        for predicate in predicates {
            if !predicate.isMatching(sample) {
                return false
            }
        }
        return true
    }
}

extension Collection
where Element: PredicateProtocol {

    // Exposed

    // Type: Collection
    // Topic: PredicateProtocol

    ///
    @inlinable
    public func allOf() -> Predicates.AllOf<Self> {
        .init(self)
    }
}

// Exposed

///
@inlinable
public func allOf<P>(
    _ predicates: P...,
    as sampleType: P.Sample.Type = P.Sample.self
) -> Predicates.AllOf<[P]> {
    assert(sampleType == P.Sample.self)
    return predicates.allOf()
}
