import Foundation

class ShowDetailsViewModel: ObservableObject {
    
    private let show: Show
    
    var name: String { show.name }

    var summary: String { show.summary.htmlToString ?? "" }

    var genres: String { show.genres.joined(separator: ", ") }

    var imageURL: URL? { URL(string: show.image.original) }

    init(show: Show) {
        self.show = show
    }
}
