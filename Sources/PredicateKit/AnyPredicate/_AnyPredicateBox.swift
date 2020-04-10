//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

@usableFromInline
class _AnyPredicateBox<Sample>: PredicateProtocol {

    // Exposed

    // Type: _AnyPredicateBox
    // Topic: Main

    @inlinable
    init() { }

    @usableFromInline
    var _underlying: Any {
        ()
    }

    @usableFromInline
    func _copy() -> _AnyPredicateBox<Sample> {
        .init()
    }

    // Protocol: PredicateProtocol
    // Topic: Main

    @usableFromInline
    func matches(_ sample: Sample) -> Bool {
        false
    }
}
