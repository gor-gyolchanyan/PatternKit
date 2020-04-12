//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns {

    // Exposed

    // Type: Patterns
    // Topic: AnyOf

    ///
    @frozen
    public struct AnyOf<Patterns>
    where Patterns: Collection, Patterns.Element: PatternProtocol {

        // Concealed

        // Type: Patterns.AnyOf
        // Topic: Main

        @inlinable
        init(_ patterns: Patterns) {
            self.patterns = patterns
        }

        @usableFromInline
        let patterns: Patterns
    }
}

extension Patterns.AnyOf: PatternProtocol {

    // Exposed

    // Protocol: PatternProtocol
    // Topic: Main

    public typealias Sample = Patterns.Element.Sample

    @inlinable
    public func indexAfterMatching<S>(prefixOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        var patterns = self.patterns[...]
        guard !patterns.isEmpty else {
            return samples.startIndex
        }
        var index: S.Index? = nil
        while
            let nextPattern = patterns.popFirst(),
            let nextIndex = nextPattern.indexAfterMatching(prefixOf: samples)
        {
            if let previousIndex = index {
                index = max(previousIndex, nextIndex)
            } else {
                index = nextIndex
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
    public typealias AnyOf<P> = Patterns.AnyOf<P>
    where P: Collection, P.Element: PatternProtocol, P.Element.Sample == Sample

    ///
    @inlinable
    public func callAsFunction<P>(anyOf patterns: P) -> AnyOf<P>
    where P: Collection, P.Element: PatternProtocol, P.Element.Sample == Sample {
        .init(patterns)
    }

    ///
    @inlinable
    public func callAsFunction<P>(anyOf patterns: P...) -> AnyOf<[P]>
    where P: PatternProtocol, P.Sample == Sample {
        self(anyOf: patterns)
    }
}

extension Factory
where Sample: Swift.Equatable {

    // Exposed

    // Type: Factory
    // Topic: Main

    ///
    @inlinable
    public func callAsFunction<S>(anyOf samples: S) -> AnyOf<LazyMapCollection<S, Equatable>>
    where S: Collection, S.Element == Sample {
        .init(samples.lazy.map { self($0) })
    }

    ///
    @inlinable
    public func callAsFunction(anyOf samples: Sample...) -> AnyOf<LazyMapCollection<[Sample], Equatable>> {
        self(anyOf: samples)
    }
}

extension Factory
where Sample: Comparable {

    // Exposed

    // Type: Factory
    // Topic: Main

    ///
    @inlinable
    public func callAsFunction<R>(anyOf rangeExpressions: R) -> AnyOf<LazyMapCollection<R, RangeExpression<R.Element>>>
    where R: Collection, R.Element: Swift.RangeExpression, R.Element.Bound == Sample {
        .init(rangeExpressions.lazy.map { self($0) })
    }

    ///
    @inlinable
    public func callAsFunction<R>(anyOf rangeExpressions: R...) -> AnyOf<LazyMapCollection<[R], RangeExpression<R>>>
    where R: Swift.RangeExpression, R.Bound == Sample {
        self(anyOf: rangeExpressions)
    }
}
