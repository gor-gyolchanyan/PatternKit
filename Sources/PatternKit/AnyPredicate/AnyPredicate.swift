//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Exposed

///
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

    ///
    @inlinable
    public init<P>(_ predicate: P)
    where P: PredicateProtocol, P.Sample == Sample {
        self.init(_AnyPredicateBoxForPredicate(predicate))
    }

    ///
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

extension AnyPattern: PatternProtocol {

    // Exposed

    // Type: PatternProtocol
    // Topic: Main

    @inlinable
    public func indexAfterMatching<S>(prefixOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        _box.indexAfterMatching(prefixOf: samples)
    }
}

extension AnyPredicate: PredicateProtocol {

    // Exposed

    // Type: PredicateProtocol
    // Topic: Main

    @inlinable
    public func isMatching(_ sample: Sample) -> Bool {
        _box.isMatching(sample)
    }
}

extension PredicateProtocol {

    // Exposed

    // Type: PredicateProtocol
    // Topic: AnyPredicate

    ///
    @inlinable
    public func eraseToAnyPredicate() -> AnyPredicate<Sample> {
        .init(self)
    }
}
