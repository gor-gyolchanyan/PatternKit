//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

@usableFromInline
final class _AnyPredicateBoxForPredicate<Predicate>: _AnyPredicateBox<Predicate.Sample>
where Predicate: PredicateProtocol {

    // Exposed

    // Type: _AnyPredicateBoxForPredicate
    // Topic: Main

    @inlinable
    init(_ predicate: Predicate) {
        _predicate = predicate
    }

    // Type: _AnyPredicateBox
    // Topic: Main

    @usableFromInline
    override var _underlying: Any {
        _predicate
    }

    @usableFromInline
    override func _copy() -> _AnyPredicateBox<Sample> {
        _AnyPredicateBoxForPredicate(_predicate)
    }

    // Protocol: PredicateProtocol
    // Topic: Main

    @usableFromInline
    typealias Sample = Predicate.Sample

    @usableFromInline
    override func matches(_ sample: Sample) -> Bool {
        _predicate.matches(sample)
    }

    // Concealed

    // Type: _AnyPredicateBox
    // Topic: Main

    @usableFromInline
    var _predicate: Predicate
}
