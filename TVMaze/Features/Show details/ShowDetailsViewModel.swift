import Foundation

@MainActor
class ShowDetailsViewModel: ObservableObject {
    
    private let show: Show

    private let api: API

    @Published
    private(set) var seasons: [Season] = []
    
    var name: String { show.name }

    var summary: String { show.summary.htmlToString ?? "" }

    var genres: String { show.genres.joined(separator: ", ") }

    var imageURL: URL? {
        guard let image = show.image else { return nil }
        return URL(string: image.original)
    }

    init(show: Show, api: API = API()) {
        self.show = show
        self.api = api
    }

    func fetchEpisodes() async {
        do {
            let episodes = try await api.fetchEpisodes(forShowId: show.id)
            seasons = episodes.groupedBySeason
        } catch {
            print(error)
        }
    }
}
