//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns {

    // Exposed

    // Type: Patterns
    // Topic: Many

    ///
    @frozen
    public struct Many<Pattern>
    where Pattern: PatternProtocol {

        // Concealed

        // Type: Patterns.Many
        // Topic: Main

        @inlinable
        init(
            _ pattern: Pattern,
            smallestCount: Int? = nil,
            largestCount: Int? = nil
        ) {
            self.pattern = pattern
            self.smallestCount = smallestCount
            self.largestCount = largestCount
        }

        @usableFromInline
        let pattern: Pattern

        @usableFromInline
        let smallestCount: Int?

        @usableFromInline
        let largestCount: Int?
    }
}

extension Patterns.Many {

    // Concealed

    // Type: Patterns.Many
    // Topic: Main

    @inlinable
    func _isIterationSmallEnough(_ iteration: Int) -> Bool {
        guard let largestCount = largestCount else {
            return true
        }
        return iteration < largestCount
    }

    @inlinable
    func _isIterationLargeEnough(_ iteration: Int) -> Bool {
        guard let smallestCount = smallestCount else {
            return true
        }
        return iteration >= smallestCount
    }
}

extension Patterns.Many: PatternProtocol {

    // Exposed

    // Protocol: PatternProtocol
    // Topic: Main

    public typealias Sample = Pattern.Sample

    @inlinable
    public func indexAfterMatching<S>(prefixOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        var index: S.Index = samples.startIndex
        var iteration = 0
        while
            _isIterationSmallEnough(iteration),
            let nextIndex = pattern.indexAfterMatching(prefixOf: samples[index...])
        {
            index = nextIndex
            iteration += 1
        }
        guard _isIterationLargeEnough(iteration) else {
            return nil
        }
        return index
    }
}

extension PatternProtocol {

    // Exposed

    // Type: PatternProtocol
    // Topic: Many

    ///
    @inlinable
    public func many() -> Patterns.Many<Self> {
        .init(self)
    }

    ///
    @inlinable
    public func many(_ count: Int) -> Patterns.Many<Self> {
        .init(self, smallestCount: count, largestCount: count)
    }

    ///
    @inlinable
    public func many(_ count: PartialRangeFrom<Int>) -> Patterns.Many<Self> {
        .init(self, smallestCount: count.lowerBound)
    }

    ///
    @inlinable
    public func many(_ count: PartialRangeThrough<Int>) -> Patterns.Many<Self> {
        .init(self, largestCount: count.upperBound)
    }

    ///
    @inlinable
    public func many(_ count: PartialRangeUpTo<Int>) -> Patterns.Many<Self> {
        .init(self, largestCount: count.upperBound - 1)
    }

    ///
    @inlinable
    public func many(_ count: ClosedRange<Int>) -> Patterns.Many<Self> {
        .init(self, smallestCount: count.lowerBound, largestCount: count.upperBound)
    }

    ///
    @inlinable
    public func many(_ count: Range<Int>) -> Patterns.Many<Self> {
        .init(self, smallestCount: count.lowerBound, largestCount: count.upperBound - 1)
    }
}
