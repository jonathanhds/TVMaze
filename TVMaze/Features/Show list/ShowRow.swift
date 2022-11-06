import SwiftUI

struct ShowRow: View {

    let show: Show

    var body: some View {
        HStack(spacing: 10) {
            AsyncImage(url: URL(string: show.image.original)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "photo.fill")
            }
            .frame(width: 120, height: 120)
            
            Text(show.name)
            
            Spacer()
        }
    }
}

struct ShowRow_Previews: PreviewProvider {
    static var previews: some View {
        ShowRow(show: Show(id: 1,
                           name: "Under the Dome",
                           summary: "<p><b>Under the Dome</b> is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The town's inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.</p>",
                           genres: ["Drama", "Science-Fiction", "Thriller"],
                           image: ContentImage(medium: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg",
                                            original: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg")))
        .previewLayout(.sizeThatFits)
    }
}
