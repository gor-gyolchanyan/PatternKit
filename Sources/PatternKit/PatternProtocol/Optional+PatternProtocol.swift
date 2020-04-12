//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

extension Optional: PatternProtocol
where Wrapped: PatternProtocol {

    // Exposed

    // Type: Optional
    // Topic: Main

    public typealias Sample = Wrapped.Sample

    @inlinable
    public func indexAfterMatching<S>(prefixOf samples: S) -> S.Index?
    where S: Collection, S.Element == Sample {
        guard let wrapped = self else {
            return samples.startIndex
        }
        return wrapped.indexAfterMatching(prefixOf: samples)
    }
}
