import Foundation

@MainActor
class ShowListViewModel: ObservableObject {

    @Published
    var searchText: String = ""

    @Published
    private var listResults: [Show] = []

    @Published
    private var searchResults: [Show] = []

    var shows: [Show] {
        if searchText.isEmpty {
            return listResults
        } else {
            return searchResults
        }
    }

    private let api: API

    init(api: API = API()) {
        self.api = api
    }

    func fetchShows() async {
        do {
            listResults = try await api.fetchShows()
        } catch {
            print(error)
        }
    }

    func searchShows() async {
        do {
            searchResults = try await api
                .searchShows(query: searchText)
                .sorted()
                .reversed()
                .map { $0.show }
        } catch {
            print(error)
        }
    }
}
