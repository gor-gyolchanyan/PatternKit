//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: AnyOf

    ///
    @frozen
    public struct AnyOf<Predicates>
    where Predicates: Collection, Predicates.Element: PredicateProtocol {

        // Exposed

        // Type: Predicates.AnyOf
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

extension Predicates.AnyOf: Equatable
where Predicates: Equatable {

    // Exposed

    // Protocol: Equatable
    // Topic: Equatable Requirements

    public static func == (_ some: Self, _ other: Self) -> Bool {
        some.predicates == other.predicates
    }
}

extension Predicates.AnyOf: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    public typealias Sample = Predicates.Element.Sample

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        for predicate in predicates {
            if predicate.isMatching(sample) {
                return true
            }
        }
        return false
    }
}

extension Collection
where Element: PredicateProtocol {

    // Exposed

    // Type: Collection
    // Topic: PredicateProtocol

    ///
    @inlinable
    public func anyOf() -> Predicates.AnyOf<Self> {
        .init(self)
    }
}
// Exposed

///
@inlinable
public func anyOf<P>(
    _ predicates: P...,
    as sampleType: P.Sample.Type = P.Sample.self
) -> Predicates.AnyOf<[P]> {
    assert(sampleType == P.Sample.self)
    return predicates.anyOf()
}
