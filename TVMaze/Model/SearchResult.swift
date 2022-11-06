import Foundation

struct SearchResult: Comparable, Decodable {
    let score: Double
    let show: Show

    static func < (lhs: SearchResult, rhs: SearchResult) -> Bool {
        lhs.score < rhs.score
    }
}
