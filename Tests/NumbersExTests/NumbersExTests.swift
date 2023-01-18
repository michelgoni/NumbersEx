import XCTest
@testable import NumbersEx

final class NumbersExTests: XCTestCase {
    func testIntExtension() throws {
        XCTAssertTrue(2.isPrime)
        XCTAssertFalse(4.isPrime)

    }

    func testURLExtension() {
        let stringToUrl: URL = "http://www.test.com"
        XCTAssertTrue(stringToUrl.scheme == "http")
    }
}
