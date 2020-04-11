//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates.The {

    // Exposed

    // Type: Predicates.The
    // Topic: Convenience

    ///
    public typealias When = Predicates.When<Sample>

    ///
    public typealias Not<P> = Predicates.Not<P>
    where P: PredicateProtocol, P.Sample == Sample

    ///
    public typealias And<P0, P1> = Predicates.And<P0, P1>
    where P0: PredicateProtocol, P1: PredicateProtocol, P0.Sample == P1.Sample, P0.Sample == Sample

    ///
    public typealias Or<P0, P1> = Predicates.Or<P0, P1>
    where P0: PredicateProtocol, P1: PredicateProtocol, P0.Sample == P1.Sample, P0.Sample == Sample

    ///
    public typealias AnyOf<P> = Predicates.AnyOf<P>
    where P: Collection, P.Element: PredicateProtocol, P.Element.Sample == Sample

    ///
    public typealias AllOf<P> = Predicates.AllOf<P>
    where P: Collection, P.Element: PredicateProtocol, P.Element.Sample == Sample

    ///
    public typealias Map<P> = Predicates.Map<P, Sample>
    where P: PredicateProtocol

    ///
    @inlinable
    public func when(
        matchedBy matchingFunction: @escaping (Sample) -> Bool
    ) -> When {
        .init(matchedBy: matchingFunction)
    }

    ///
    @inlinable
    public func anyOf<P>(
        _ predicates: P...
    ) -> AnyOf<[P]> {
        predicates.anyOf()
    }

    ///
    @inlinable
    public func allOf<P>(
        _ predicates: P...
    ) -> AllOf<[P]> {
        predicates.allOf()
    }
}

extension Predicates.The
where Sample: Equatable {

    // Exposed

    // Type: Predicates.The
    // Topic: Convenience

    ///
    public typealias EqualTo = Predicates.EqualTo<Sample>

    ///
    @inlinable
    public func equalTo(
        _ sample: Sample
    ) -> EqualTo {
        return .init(sample)
    }
}

extension Predicates.The
where Sample: Comparable {

    // Exposed

    // Type: Predicates.The
    // Topic: Convenience

    ///
    public typealias InRange<S> = Predicates.InRange<S>
    where S: RangeExpression, S.Bound == Sample

    ///
    @inlinable
    public func inRange<S>(
        _ sampleRange: S
    ) -> InRange<S> {
        return .init(sampleRange)
    }
}
