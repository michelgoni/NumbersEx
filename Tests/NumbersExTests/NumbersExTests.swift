import XCTest
@testable import NumbersEx

final class NumbersExTests: XCTestCase {
    func testIntExtension() throws {
        XCTAssertTrue(2.isPrime)
        XCTAssertFalse(4.isPrime)

    }
}
