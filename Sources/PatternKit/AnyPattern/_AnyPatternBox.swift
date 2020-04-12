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
        fatalError("Execution has reached a routine that should've been overridden.")
    }

    @usableFromInline
    func _copy() -> _AnyPatternBox<Sample> {
        fatalError("Execution has reached a routine that should've been overridden.")
    }

    // Protocol: PatternProtocol
    // Topic: Main

    @usableFromInline
    func indexAfterMatching<S>(prefixOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        fatalError("Execution has reached a routine that should've been overridden.")
    }
}
