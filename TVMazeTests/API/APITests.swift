import XCTest
@testable import TVMaze

final class APITests: XCTestCase {
    
    func testFetchShows() async throws {
        let api = API()
        
        let shows = try await api.fetchShows()
        
        XCTAssertTrue(shows.count > 0)
    }

    func testSearchShows() async throws {
        let api = API()

        let shows = try await api.searchShows(query: "Under the Dome")

        XCTAssertTrue(shows.count > 0)
    }

    func testFetchEpisodes() async throws {
        let api = API()

        let shows = try await api.fetchEpisodes(forShowId: 1)

        XCTAssertTrue(shows.count > 0)
    }
}
