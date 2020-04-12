//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns {

    // Exposed

    // Type: Patterns
    // Topic: AllOf

    ///
    @frozen
    public struct AllOf<Patterns>
    where Patterns: Collection, Patterns.Element: PatternProtocol {

        // Concealed

        // Type: Patterns.AllOf
        // Topic: Main

        @inlinable
        init(_ patterns: Patterns) {
            self.patterns = patterns
        }

        @usableFromInline
        let patterns: Patterns
    }
}

extension Patterns.AllOf: PatternProtocol {

    // Exposed

    // Protocol: PatternProtocol
    // Topic: Main

    public typealias Sample = Patterns.Element.Sample

    @inlinable
    public func indexAfterMatching<S>(prefixOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        var patterns = self.patterns[...]
        var index: S.Index
        if let firstPattern = patterns.popFirst() {
            guard
                let firstIndex = firstPattern.indexAfterMatching(prefixOf: samples)
            else {
                return nil
            }
            index = firstIndex
        } else {
            return samples.startIndex
        }
        while let nextPattern = patterns.popFirst() {
            guard
                let nextIndex = nextPattern.indexAfterMatching(prefixOf: samples),
                nextIndex == index
            else {
                return nil
            }
        }
        return index
    }
}

extension Factory {

    // Exposed

    // Type: Factory
    // Topic: Main

    ///
    public typealias AllOf<P> = Patterns.AllOf<P>
    where P: Collection, P.Element: PatternProtocol, P.Element.Sample == Sample

    ///
    @inlinable
    public func callAsFunction<P>(allOf patterns: P) -> AllOf<P>
    where P: Collection, P.Element: PatternProtocol, P.Element.Sample == Sample {
        .init(patterns)
    }

    ///
    @inlinable
    public func callAsFunction<P>(allOf patterns: P...) -> AllOf<[P]>
    where P: PatternProtocol, P.Sample == Sample {
        self(allOf: patterns)
    }
}

extension Factory
where Sample: Swift.Equatable {

    // Exposed

    // Type: Factory
    // Topic: Main

    ///
    @inlinable
    public func callAsFunction<S>(allOf samples: S) -> AllOf<LazyMapCollection<S, Equatable>>
    where S: Collection, S.Element == Sample {
        .init(samples.lazy.map { self($0) })
    }

    ///
    @inlinable
    public func callAsFunction(allOf samples: Sample...) -> AllOf<LazyMapCollection<[Sample], Equatable>> {
        self(allOf: samples)
    }
}

extension Factory
where Sample: Comparable {

    // Exposed

    // Type: Factory
    // Topic: Main

    ///
    @inlinable
    public func callAsFunction<R>(allOf rangeExpressions: R) -> AllOf<LazyMapCollection<R, RangeExpression<R.Element>>>
    where R: Collection, R.Element: Swift.RangeExpression, R.Element.Bound == Sample {
        .init(rangeExpressions.lazy.map { self($0) })
    }

    ///
    @inlinable
    public func callAsFunction<R>(allOf rangeExpressions: R...) -> AllOf<LazyMapCollection<[R], RangeExpression<R>>>
    where R: Swift.RangeExpression, R.Bound == Sample {
        self(allOf: rangeExpressions)
    }
}
