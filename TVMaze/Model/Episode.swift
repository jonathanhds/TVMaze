import Foundation

struct Episode: Identifiable, Decodable, Hashable, Comparable {
    let id: Int
    let name: String
    let season: Int
    let number: Int
    let image: ContentImage?
    let summary: String

    static func == (lhs: Episode, rhs: Episode) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func < (lhs: Episode, rhs: Episode) -> Bool {
        lhs.number < rhs.number
    }
}
