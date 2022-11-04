import Foundation

class ShowDetailsViewModel: ObservableObject {
    
    private let show: Show
    
    var name: String { show.name }
    
    init(show: Show) {
        self.show = show
    }
}
