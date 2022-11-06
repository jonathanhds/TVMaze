import SwiftUI

struct ShowListView: View {

    @ObservedObject
    private var viewModel = ShowListViewModel()

    var body: some View {
        Group {
            List(viewModel.shows) { show in
                NavigationLink(value: show) {
                    ShowRow(show: show)
                }
            }
            .navigationDestination(for: Show.self) { show in
                ShowDetailsView(show: show)
            }
            .navigationDestination(for: Episode.self) { episode in
                EpisodeDetailsView(episode: episode)
            }
        }
        .navigationTitle("Shows")
        .task {
            await viewModel.fetchShows()
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
