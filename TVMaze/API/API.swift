import Foundation

enum APIError: Error {
    case invalidResponse
    case errorResponse
}

class API {

    private let BASE_URL = "https://api.tvmaze.com"

    private let decoder = JSONDecoder()

    func fetchShows() async throws -> [Show] {
        let url = URL(string: "\(BASE_URL)/shows")!
        let data = try await doGet(url: url)

        return try decoder.decode([Show].self, from: data)
    }

    func fetchEpisodes(forShowId id: Int) async throws -> [Episode] {
        let url = URL(string: "\(BASE_URL)/shows/\(id)/episodes")!
        let data = try await doGet(url: url)

        return try decoder.decode([Episode].self, from: data)
    }

    private func doGet(url: URL) async throws -> Data {
        let request = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse else { throw APIError.invalidResponse }

        switch response.statusCode {
        case 200..<300:
            return data
        default:
            throw APIError.errorResponse
        }
    }
}
