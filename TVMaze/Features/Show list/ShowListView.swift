import SwiftUI

struct ShowListView: View {

	@ObservedObject
	private var viewModel = ShowListViewModel()

	var body: some View {
		Group {
			List(viewModel.shows) { show in
				ShowRow(show: show)
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
