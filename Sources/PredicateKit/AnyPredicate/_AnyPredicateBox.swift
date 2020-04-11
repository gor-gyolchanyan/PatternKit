//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Concealed

@usableFromInline
class _AnyPredicateBox<Sample>: PredicateProtocol {

    // Exposed

    // Type: _AnyPredicateBox
    // Topic: Main

    @inlinable
    init() { }

    @usableFromInline
    var _underlying: Any {
        fatalError("Execution has reached a routine that should've been overridden.")
    }

    @usableFromInline
    func _copy() -> _AnyPredicateBox<Sample> {
        fatalError("Execution has reached a routine that should've been overridden.")
    }

    // Protocol: PredicateProtocol
    // Topic: Main

    @usableFromInline
    func isMatching(_ sample: Sample) -> Bool {
        fatalError("Execution has reached a routine that should've been overridden.")
    }
}
