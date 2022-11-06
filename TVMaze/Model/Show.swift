import Foundation

struct Show: Identifiable, Hashable, Decodable {
    let id: Int
    let name: String
    let summary: String
    let genres: [String]
    let image: ContentImage?

    static func == (lhs: Show, rhs: Show) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
