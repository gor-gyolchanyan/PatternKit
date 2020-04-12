//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns {

    // Exposed

    // Type: Patterns
    // Topic: InOrder

    ///
    @frozen
    public struct InOrder<Patterns>
    where Patterns: Collection, Patterns.Element: PatternProtocol {

        // Concealed

        // Type: Patterns.InOrder
        // Topic: Main

        @inlinable
        init(_ patterns: Patterns) {
            self.patterns = patterns
        }

        @usableFromInline
        let patterns: Patterns
    }
}

extension Patterns.InOrder: PatternProtocol {

    // Exposed

    // Protocol: PatternProtocol
    // Topic: Main

    public typealias Sample = Patterns.Element.Sample

    @inlinable
    public func indexAfterMatching<S>(prefixOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        var sampleIndex = samples.startIndex
        for pattern in patterns {
            guard
                let nextSampleIndex = pattern.indexAfterMatching(prefixOf: samples[sampleIndex...])
            else {
                return nil
            }
            sampleIndex = nextSampleIndex
        }
        return sampleIndex
    }
}

extension Factory {

    // Exposed

    // Type: Factory
    // Topic: Main

    ///
    public typealias InOrder<P> = Patterns.InOrder<P>
    where P: Collection, P.Element: PatternProtocol, P.Element.Sample == Sample

    ///
    @inlinable
    public func callAsFunction<P>(inOrder patterns: P) -> InOrder<P>
    where P: Collection, P.Element: PatternProtocol, P.Element.Sample == Sample {
        .init(patterns)
    }

    ///
    @inlinable
    public func callAsFunction<P>(inOrder patterns: P...) -> InOrder<[P]>
    where P: PatternProtocol, P.Sample == Sample {
        self(inOrder: patterns)
    }
}

extension Factory
where Sample: Swift.Equatable {

    // Exposed

    // Type: Factory
    // Topic: Main

    ///
    @inlinable
    public func callAsFunction<S>(inOrder samples: S) -> InOrder<LazyMapCollection<S, Equatable>>
    where S: Collection, S.Element == Sample {
        .init(samples.lazy.map { self($0) })
    }

    ///
    @inlinable
    public func callAsFunction(inOrder samples: Sample...) -> InOrder<LazyMapCollection<[Sample], Equatable>> {
        self(inOrder: samples)
    }
}

extension Factory
where Sample: Comparable {

    // Exposed

    // Type: Factory
    // Topic: Main

    ///
    @inlinable
    public func callAsFunction<R>(inOrder rangeExpressions: R) -> InOrder<LazyMapCollection<R, RangeExpression<R.Element>>>
    where R: Collection, R.Element: Swift.RangeExpression, R.Element.Bound == Sample {
        self(inOrder: rangeExpressions.lazy.map { self($0) })
    }

    ///
    @inlinable
    public func callAsFunction<R>(inOrder rangeExpressions: R...) -> InOrder<LazyMapCollection<[R], RangeExpression<R>>>
    where R: Swift.RangeExpression, R.Bound == Sample {
        self(inOrder: rangeExpressions)
    }
}

extension Factory
where Sample == Unicode.Scalar {

    // Exposed

    // Type: Factory
    // Topic: Main

    ///
    @inlinable
    public func callAsFunction<S>(inOrder string: S) -> InOrder<LazyMapCollection<S.UnicodeScalarView, Equatable>>
    where S: StringProtocol {
        self(inOrder: string.unicodeScalars)
    }
}
