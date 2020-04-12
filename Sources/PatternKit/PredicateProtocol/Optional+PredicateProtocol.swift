//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Optional: PredicateProtocol
where Wrapped: PredicateProtocol {

    // Exposed

    // Type: Optional
    // Topic: Main

    @inlinable
    public func isMatching(_ sample: Wrapped.Sample) -> Bool {
        guard let wrapped = self else {
            return true
        }
        return wrapped.isMatching(sample)
    }
}
