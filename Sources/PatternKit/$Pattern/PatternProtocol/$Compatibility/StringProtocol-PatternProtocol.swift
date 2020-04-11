//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension StringProtocol {

    // Exposed

    // Type: StringProtocol
    // Topic: PatternProtocol

    ///
    @inlinable
    public func prefix<P>(matching pattern: P) -> SubSequence?
    where P: PatternProtocol, P.Sample == Unicode.Scalar {
        guard
            let index = pattern.indexAfterMatching(atStartIndexOf: unicodeScalars)
        else {
            return nil
        }
        return prefix(upTo: index)
    }
}
