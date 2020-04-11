//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Exposed

///
public protocol PredicateProtocol {

    // Exposed

    // Type: PredicateProtocol
    // Topic: Main

    ///
    associatedtype Sample

    ///
    func isMatching(_ sample: Sample) -> Bool
}
