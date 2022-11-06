import SwiftUI

struct EpisodeDetailsView: View {

    @ObservedObject
    private var viewModel: EpisodeDetailsViewModel

    init(episode: Episode) {
        viewModel = EpisodeDetailsViewModel(episode: episode)
    }

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                AsyncImage(url: viewModel.imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }

                VStack(spacing: 16) {
                    Text("Episode \(viewModel.number), Season \(viewModel.season)")
                        .font(.caption)

                    Text(viewModel.summary)
                }
                .padding()
            }
        }
        .navigationTitle(viewModel.name)
    }
}

struct EpisodeDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EpisodeDetailsView(episode: Episode(id: 24,
                                                name: "Black Ice",
                                                season: 2,
                                                number: 11,
                                                image: ContentImage(medium:
                                                                        "https://static.tvmaze.com/uploads/images/medium_landscape/4/10456.jpg",
                                                                    original:
                                                                        "https://static.tvmaze.com/uploads/images/original_untouched/4/10456.jpg"),
                                                summary: "<p>When temperatures begin to plunge, Sam and Rebecca spring into action to try to save the residents of Chester's Mill. Meanwhile, Barbie risks his own life in order to save Julia after a terrible accident.</p>"))
        }
    }
}
