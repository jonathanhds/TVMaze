import Foundation

class EpisodeDetailsViewModel: ObservableObject {

    private let episode: Episode

    var name: String { episode.name }

    var summary: String { episode.summary.htmlToString ?? "" }

    var season: Int { episode.season }

    var number: Int { episode.number }

    var imageURL: URL? { URL(string: episode.image.original) }

    init(episode: Episode) {
        self.episode = episode
    }
}
