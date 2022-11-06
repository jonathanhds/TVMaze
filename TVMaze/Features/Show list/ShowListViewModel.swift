import Foundation

@MainActor
class ShowListViewModel: ObservableObject {

    @Published
    private(set) var shows: [Show] = []

    private let api: API

    init(api: API = API()) {
        self.api = api
    }

    func fetchShows() async {
        do {
            shows = try await api.fetchShows()
        } catch {
            print(error)
        }
    }
}
