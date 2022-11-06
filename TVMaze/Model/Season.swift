import Foundation

struct Season: Identifiable, Comparable {
    var id: Int { number }
    let number: Int
    let episodes: [Episode]

    static func < (lhs: Season, rhs: Season) -> Bool {
        lhs.number < rhs.number
    }
}

extension Array where Element == Episode {
    var groupedBySeason: [Season] {
        var seasonsMapping: [Int: Season] = [:]

        sorted().forEach { episode in
            if let season = seasonsMapping[episode.season] {
                var episodes = season.episodes
                episodes.append(episode)

                seasonsMapping[episode.season] = Season(number: season.number,
                                                        episodes: episodes)
            } else {
                seasonsMapping[episode.season] = Season(number: episode.season,
                                                        episodes: [episode])
            }
        }

        return seasonsMapping.values.sorted()
    }
}
