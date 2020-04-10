//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Predicates {

    // Exposed

    // Type: Predicates
    // Topic: The

    @frozen
    public struct The<Sample> {

        // Concealed

        // Type: Predicates.The
        // Topic: Main

        @inlinable
        init() { }
    }
}

public func the<S, P>(
    _ keyPath: KeyPath<Predicates.The<S>, P>,
    as sampleType: S.Type = S.self
) -> P
where P: PredicateProtocol {
    assert(sampleType == S.self)
    return Predicates.The<S>()[keyPath: keyPath]
}
