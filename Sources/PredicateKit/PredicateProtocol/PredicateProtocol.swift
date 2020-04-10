//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

// Exposed

/// A [predicate](https://en.wikipedia.org/wiki/Predicate_(mathematical_logic)).
///
/// Predicate is a type that is able to determine whether or not values of a compatible type (**samples**) match a criterion (represented by instances of `Self`).
public protocol PredicateProtocol {

    // Exposed

    // Type: PredicateProtocol
    // Topic: Main

    /// The type of values that can be matched against the criterion represented by instances of `Self`.
    associatedtype Sample

    /// Determines whether or not `sample` matches the criterion represented by `self`.
    ///
    /// - parameter sample: The value that should be matched against the criterion represented by `self`.
    /// - returns: Returns `true` if the value matches the criterion, otherwise returns `false`.
    func matches(_ sample: Sample) -> Bool
}
