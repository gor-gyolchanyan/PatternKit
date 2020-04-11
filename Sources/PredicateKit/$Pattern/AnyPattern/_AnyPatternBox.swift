//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Concealed

@usableFromInline
class _AnyPatternBox<Sample>: PatternProtocol {

    // Exposed

    // Type: _AnyPatternBox
    // Topic: Main

    @inlinable
    init() { }

    @usableFromInline
    var _underlying: Any {
        ()
    }

    @usableFromInline
    func _copy() -> _AnyPatternBox<Sample> {
        .init()
    }

    // Protocol: PatternProtocol
    // Topic: Main

    @usableFromInline
    func indexAfterMatching<S>(atStartIndexOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        nil
    }
}
