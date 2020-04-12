//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Concealed

@usableFromInline
final class _AnyPatternBoxForPattern<Pattern>: _AnyPatternBox<Pattern.Sample>
where Pattern: PatternProtocol {

    // Exposed

    // Type: _AnyPatternBoxForPattern
    // Topic: Main

    @inlinable
    init(_ pattern: Pattern) {
        _pattern = pattern
    }

    // Type: _AnyPatternBox
    // Topic: Main

    @usableFromInline
    override var _underlying: Any {
        _pattern
    }

    @usableFromInline
    override func _copy() -> _AnyPatternBox<Sample> {
        _AnyPatternBoxForPattern(_pattern)
    }

    // Protocol: PatternProtocol
    // Topic: Main

    @usableFromInline
    typealias Sample = Pattern.Sample

    @usableFromInline
    override func indexAfterMatching<S>(prefixOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        _pattern.indexAfterMatching(prefixOf: samples)
    }

    // Concealed

    // Type: _AnyPatternBox
    // Topic: Main

    @usableFromInline
    var _pattern: Pattern
}
