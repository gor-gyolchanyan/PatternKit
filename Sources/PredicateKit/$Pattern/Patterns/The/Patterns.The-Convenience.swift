//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns.The {

    // Exposed

    // Type: Patterns.The
    // Topic: Convenience

    ///
    public typealias Many<P> = Patterns.Many<P>
    where P: PatternProtocol, P.Sample == Sample

    ///
    public typealias Not<P> = Patterns.Not<P>
    where P: PatternProtocol, P.Sample == Sample

    ///
    public typealias And<P0, P1> = Patterns.And<P0, P1>
    where P0: PatternProtocol, P1: PatternProtocol, P0.Sample == P1.Sample, P0.Sample == Sample

    ///
    public typealias Or<P0, P1> = Patterns.Or<P0, P1>
    where P0: PatternProtocol, P1: PatternProtocol, P0.Sample == P1.Sample, P0.Sample == Sample

    ///
    public typealias AnyOf<P> = Patterns.AnyOf<P>
    where P: Collection, P.Element: PatternProtocol, P.Element.Sample == Sample

    ///
    public typealias AllOf<P> = Patterns.AllOf<P>
    where P: Collection, P.Element: PatternProtocol, P.Element.Sample == Sample

    ///
    public typealias Serially<P> = Patterns.Serially<P>
    where P: Collection, P.Element: PatternProtocol, P.Element.Sample == Sample

    ///
    public typealias Map<P> = Patterns.Map<P, Sample>
    where P: PatternProtocol

    ///
    public typealias CompactMap<P> = Patterns.CompactMap<P, Sample>
    where P: PatternProtocol

    ///
    @inlinable
    public func anyOf<P>(
        _ patterns: P...
    ) -> AnyOf<[P]> {
        patterns.anyOf()
    }

    ///
    @inlinable
    public func allOf<P>(
        _ patterns: P...
    ) -> AllOf<[P]> {
        patterns.allOf()
    }

    ///
    @inlinable
    public func serially<P>(
        _ patterns: P...
    ) -> Serially<[P]> {
        patterns.serially()
    }
}
