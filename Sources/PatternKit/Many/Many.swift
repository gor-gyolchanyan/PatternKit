//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Exposed

///
@frozen
public struct Many {

    // Exposed

    // Type: Many
    // Topic: Main

    ///
    @inlinable
    public init(
        leastCount: Int = .zero,
        mostCount: Int = .max
    ) {
        var leastCount = leastCount
        var mostCount = mostCount

        if leastCount > mostCount {
            swap(&leastCount, &mostCount)
        }
        if leastCount < .zero {
            leastCount = .zero
        }
        if mostCount < .zero {
            mostCount = .zero
        }

        self.leastCount = leastCount
        self.mostCount = mostCount
    }

    ///
    public let leastCount: Int

    ///
    public let mostCount: Int
}

extension Many {

    // Exposed

    // Type: Many
    // Topic: Main

    ///
    @inlinable
    public init(_ count: Int) {
        self.init(leastCount: count, mostCount: count)
    }

    ///
    @inlinable
    public init(_ count: PartialRangeFrom<Int>) {
        self.init(leastCount: count.lowerBound)
    }

    ///
    @inlinable
    public init(_ count: PartialRangeThrough<Int>) {
        self.init(mostCount: count.upperBound)
    }

    ///
    @inlinable
    public init(_ count: PartialRangeUpTo<Int>) {
        self.init(mostCount: count.upperBound - 1)
    }

    ///
    @inlinable
    public init(_ count: ClosedRange<Int>) {
        self.init(leastCount: count.lowerBound, mostCount: count.upperBound)
    }

    ///
    @inlinable
    public init(_ count: Range<Int>) {
        self.init(leastCount: count.lowerBound, mostCount: count.upperBound - 1)
    }

    ///
    @inlinable
    public func reduce<R>(
        into initialResult: R,
        _ updateAccumulatingResult: (inout R) throws -> Bool
    ) rethrows -> R? {
        var result = initialResult
        var index = 0
        while
            index < mostCount,
            try updateAccumulatingResult(&result)
        {
            index += 1
        }
        guard index >= leastCount else {
            return nil
        }
        return result
    }

    ///
    @inlinable
    public func reduce<R>(
        _ initialResult: R,
        _ nextPartialResult: (R) throws -> R?
    ) rethrows -> R? {
        try reduce(into: initialResult) { result in
            guard
                let nextPartialResult = try nextPartialResult(result)
            else {
                return false
            }
            result = nextPartialResult
            return true
        }
    }
}
