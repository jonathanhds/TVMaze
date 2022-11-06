import SwiftUI

struct ShowListView: View {

    @StateObject
    private var viewModel = ShowListViewModel()

    var body: some View {
        List(viewModel.shows) { show in
            NavigationLink(value: show) {
                ShowRow(show: show)
            }
        }
        .navigationDestination(for: Show.self) { show in
            ShowDetailsView(viewModel: .init(show: show))
        }
        .navigationDestination(for: Episode.self) { episode in
            EpisodeDetailsView(viewModel: .init(episode: episode))
        }
        .navigationTitle("Shows")
        .searchable(text: $viewModel.searchText)
        .onSubmit(of: .search, runSearch)
        .onChange(of: viewModel.searchText) { _ in runSearch() }
        .task {
            await viewModel.fetchShows()
        }
    }

    private func runSearch() {
        Task {
            await viewModel.searchShows()
        }
    }
}

struct ShowListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ShowListView()
        }
    }
}
