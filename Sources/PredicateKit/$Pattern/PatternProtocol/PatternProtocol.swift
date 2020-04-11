//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Exposed

///
public protocol PatternProtocol {

    // Exposed

    // Type: PatternProtocol
    // Topic: Main

    ///
    associatedtype Sample

    ///
    func indexAfterMatching<S>(atStartIndexOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample
}
