import SwiftUI

struct EpisodeCell: View {
    let episode: Episode

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: episode.image.medium)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray
            }

            Text(episode.name)
                .font(.caption)
                .lineLimit(1)
                .truncationMode(.tail)
        }
    }
}

struct EpisodeCell_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeCell(episode: Episode(id: 1,
                                     name: "Pilot",
                                     season: 1,
                                     number: 1,
                                     image: ContentImage(medium: "https://static.tvmaze.com/uploads/images/medium_landscape/1/4388.jpg",
                                                         original: "https://static.tvmaze.com/uploads/images/original_untouched/1/4388.jpg"),
                                     summary: "<p>When the residents of Chester's Mill find themselves trapped under a massive transparent dome with no way out, they struggle to survive as resources rapidly dwindle and panic quickly escalates.</p>"))
        .previewLayout(.sizeThatFits)
    }
}
