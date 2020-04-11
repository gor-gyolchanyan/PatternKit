//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Patterns {

    // Exposed

    // Type: Patterns
    // Topic: The

    ///
    @frozen
    public struct The<Sample> {

        // Concealed

        // Type: Patterns.The
        // Topic: Main

        @inlinable
        init() { }
    }
}

// Exposed

///
public func the<S, P>(
    _ keyPath: KeyPath<Patterns.The<S>, P>,
    as sampleType: S.Type = S.self
) -> P
where P: PatternProtocol {
    assert(sampleType == S.self)
    return Patterns.The<S>()[keyPath: keyPath]
}
