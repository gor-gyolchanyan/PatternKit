//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Exposed

@frozen
public struct AnyPredicate<Sample> {

    // Concealed

    // Type: AnyPredicate
    // Topic: Main

    @inlinable
    init(_ box: _AnyPredicateBox<Sample>) {
        _box = box
    }

    @usableFromInline
    var _box: _AnyPredicateBox<Sample>
}

extension AnyPredicate {

    // Exposed

    // Type: AnyPredicate
    // Topic: Main

    @inlinable
    public init<Predicate>(_ predicate: Predicate)
    where Predicate: PredicateProtocol, Predicate.Sample == Sample {
        self.init(_AnyPredicateBoxForPredicate(predicate))
    }

    @inlinable
    public var underlying: Any {
        _box._underlying
    }

    // Concealed

    // Type: AnyPredicate
    // Topic: Main

    @inlinable
    mutating func _prepareToMutate() {
        if !isKnownUniquelyReferenced(&_box) {
            _box = _box._copy()
        }
    }
}

extension AnyPredicate: PredicateProtocol {

    // Exposed

    // Type: PredicateProtocol
    // Topic: Main

    @inlinable
    public func matches(_ sample: Sample) -> Bool {
        _box.matches(sample)
    }
}
