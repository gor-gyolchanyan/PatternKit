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

extension Predicates.AnyOf: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    public typealias Sample = Predicates.Element.Sample

    @inlinable
    public func matches(_ sample: Sample) -> Bool {
        for predicate in predicates {
            if predicate.matches(sample) {
                return true
            }
        }
        return false
    }
}

@inlinable
public func anyOf<P>(
    _ predicates: P...,
    as sampleType: P.Sample.Type = P.Sample.self
) -> Predicates.AnyOf<[P]> {
    assert(sampleType == P.Sample.self)
    return .init(predicates)
}
