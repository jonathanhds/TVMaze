import XCTest
@testable import TVMaze

final class String_HTMLTests: XCTestCase {

    func testRemoveHTMLTags() async throws {
        XCTAssertEqual("<b>Hello World</b>".stripHTMLTags, "Hello World")
        XCTAssertEqual("<p><i>Foo</i> <b>Bar<b/></p>".stripHTMLTags, "Foo Bar")
    }
}
