import XCTest
import Combine
@testable import NumbersEx
@available(iOS 13.0, *)
final class NumbersExTests: XCTestCase {

    lazy var cancellables = Set<AnyCancellable>()

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

    func testJust() throws {
        let mockClass = MockClass()
        mockClass.returnValue = .just("test")
        mockClass.returnValue.sink { _ in

        } receiveValue: { value in
            XCTAssertTrue(value == "test")
        }.store(in: &cancellables)
    }

    func testError() throws {
        let mockClass = MockClass()
        let expectation = expectation(description: "Extepcation for testError")
        mockClass.returnValue = .fail(NSError())
        mockClass.returnValue.sink { completion in
            if case .failure = completion {
                expectation.fulfill()
            }
        } receiveValue: { _ in

        }.store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)

    }


    private func mockData(_ number: Int) async  -> Data {

        Data()
    }
}

@available(iOS 13.0, *)
class MockClass {

    var returnValue: AnyPublisher<String, Error>!
}
