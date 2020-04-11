//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Exposed

///
@frozen
public struct AnyPattern<Sample> {

    // Concealed

    // Type: AnyPattern
    // Topic: Main

    @inlinable
    init(_ box: _AnyPatternBox<Sample>) {
        _box = box
    }

    @usableFromInline
    var _box: _AnyPatternBox<Sample>
}

extension AnyPattern {

    // Exposed

    // Type: AnyPattern
    // Topic: Main

    ///
    @inlinable
    public init<P>(_ pattern: P)
    where P: PatternProtocol, P.Sample == Sample {
        self.init(_AnyPatternBoxForPattern(pattern))
    }

    ///
    @inlinable
    public var underlying: Any {
        _box._underlying
    }

    // Concealed

    // Type: AnyPattern
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
    public func indexAfterMatching<S>(atStartIndexOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        _box.indexAfterMatching(atStartIndexOf: samples)
    }
}

extension PatternProtocol {

    // Exposed

    // Type: PatternProtocol
    // Topic: AnyPattern

    @inlinable
    public func asAny() -> AnyPattern<Sample> {
        .init(self)
    }
}
