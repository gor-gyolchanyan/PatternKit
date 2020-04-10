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

extension Predicates.AllOf: PredicateProtocol {

    // Exposed

    // Protocol: PredicateProtocol
    // Topic: Main

    public typealias Sample = Predicates.Element.Sample

    @inlinable
    public func matches(_ sample: Sample) -> Bool {
        for predicate in predicates {
            if !predicate.matches(sample) {
                return false
            }
        }
        return true
    }
}

@inlinable
public func allOf<P>(
    _ predicates: P...,
    as sampleType: P.Sample.Type = P.Sample.self
) -> Predicates.AllOf<[P]> {
    assert(sampleType == P.Sample.self)
    return .init(predicates)
}
