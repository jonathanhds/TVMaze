import SwiftUI

struct ShowDetailsView: View {

    @ObservedObject
    private var viewModel: ShowDetailsViewModel

    init(show: Show) {
        viewModel = ShowDetailsViewModel(show: show)
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
                    Text(viewModel.name)
                        .font(.title)

                    Text(viewModel.genres)
                        .font(.caption)

                    Text(viewModel.summary)
                }
                .padding()

                VStack(alignment: .leading, spacing: 16) {
                    Text("Episodes")
                        .font(.title2)

                    ForEach(viewModel.seasons) { season in
                        Text("Season \(season.number)")
                            .font(.title3)

                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(season.episodes) { episode in
                                    EpisodeCell(episode: episode)
                                        .frame(width: 100)
                                }
                            }
                        }
                    }
                }
                .padding([.leading, .trailing, .bottom])
            }
        }
        .task {
            await viewModel.fetchEpisodes()
        }
    }
}

struct ShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ShowDetailsView(show: Show(id: 2,
                                       name: "Person of Interest",
                                       summary: "<p>You are being watched. The government has a secret system, a machine that spies on you every hour of every day. I know because I built it. I designed the Machine to detect acts of terror but it sees everything. Violent crimes involving ordinary people. People like you. Crimes the government considered \"irrelevant\". They wouldn't act so I decided I would. But I needed a partner. Someone with the skills to intervene. Hunted by the authorities, we work in secret. You'll never find us. But victim or perpetrator, if your number is up, we'll find you.</p>",
                                       genres: ["Action", "Crime", "Science-Fiction"],
                                       image: ContentImage(medium: "https://static.tvmaze.com/uploads/images/medium_portrait/163/407679.jpg",
                                                        original: "https://static.tvmaze.com/uploads/images/original_untouched/163/407679.jpg")))
        }
    }
}
