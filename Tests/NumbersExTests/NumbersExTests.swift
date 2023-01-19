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

    func testAsyncSequenceExtension() async throws {
    
        let value =  await [1, 3, 8].asyncMap { number in
            await mockData(number)
        }
        XCTAssertFalse(value.isEmpty)
    }


    private func mockData(_ number: Int) async  -> Data {

        Data()
    }
}
