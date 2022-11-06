import Foundation

class EpisodeDetailsViewModel: ObservableObject {

    private let episode: Episode

    var name: String { episode.name }

    var summary: String { episode.summary.stripHTMLTags ?? "" }

    var season: Int { episode.season }

    var number: Int { episode.number }

    var imageURL: URL? {
        guard let image = episode.image else { return nil }
        return URL(string: image.original)
    }

    init(episode: Episode) {
        self.episode = episode
    }
}
