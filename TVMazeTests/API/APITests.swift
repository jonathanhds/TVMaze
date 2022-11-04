import XCTest
@testable import TVMaze

final class APITests: XCTestCase {
    
    func testIntegrationWorks() async throws {
        let api = API()
        
        let shows = try await api.fetchShows()
        
        XCTAssertTrue(shows.count > 0)
    }
}
