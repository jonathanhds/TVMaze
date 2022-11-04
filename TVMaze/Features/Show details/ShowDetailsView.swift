import SwiftUI

struct ShowDetailsView: View {

    private let viewModel: ShowDetailsViewModel

    init(show: Show) {
        viewModel = ShowDetailsViewModel(show: show)
    }

    var body: some View {
        Text(viewModel.name)
    }
}

struct ShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ShowDetailsView(show: Show(id: 2,
                                       name: "Person of Interest",
                                       image: ShowImage(medium: "https://static.tvmaze.com/uploads/images/medium_portrait/163/407679.jpg",
                                                        original: "https://static.tvmaze.com/uploads/images/original_untouched/163/407679.jpg")))
        }
    }
}
