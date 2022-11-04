import Foundation

enum APIError: Error {
	case invalidResponse
	case errorResponse
}

class API {

	private let decoder = JSONDecoder()

	func fetchShows() async throws -> [Show] {
		let url = URL(string: "https://api.tvmaze.com/shows")!
		let request = URLRequest(url: url)

		let (data, response) = try await URLSession.shared.data(for: request)
		guard let response = response as? HTTPURLResponse else { throw APIError.invalidResponse }

		switch response.statusCode {
		case 200..<300:
			return try decoder.decode([Show].self, from: data)
		default:
			throw APIError.errorResponse
		}
	}
}
