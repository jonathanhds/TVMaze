import Foundation

extension String {
    var stripHTMLTags: String? {
        replacingOccurrences(of: "<[^>]+>",
                             with: "",
                             options: .regularExpression,
                             range: nil)
    }
}
