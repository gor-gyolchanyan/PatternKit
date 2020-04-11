//
// Introductory information can be found in the `README.md` file located in the root directory of this repository.
// Licensing information can be found in the `LICENSE` file located in the root directory of this repository.
//

import PatternKit

extension Predicates.The
where Sample == Unicode.Scalar {

    // Concealed

    // Type: Predicates.The
    // Topic: Unicode.Scalar

    var isASCII: When {
        when { $0.isASCII }
    }

    var isAlphabetic: When {
        when { $0.properties.isAlphabetic }
    }

    var isWhitespace: When {
        when { $0.properties.isWhitespace }
    }
}
