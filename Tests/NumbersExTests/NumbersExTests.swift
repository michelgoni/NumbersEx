import XCTest
import Combine
@testable import NumbersEx
@available(iOS 13.0, *)
final class NumbersExTests: XCTestCase, AsyncHandler {

    lazy var cancellables = Set<AnyCancellable>()

    func testIntExtension() throws {
        XCTAssertTrue(2.isPrime)
        XCTAssertFalse(4.isPrime)
        XCTAssertFalse(2.isOdd)
        XCTAssertTrue(2.isEven)
        XCTAssertTrue(3.isOdd)
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
        mockClass.returnValue
            .subscribe(on: global)
            .receive(on: main)
            .sink { _ in

        } receiveValue: { value in
            XCTAssertTrue(value == "test")
        }.store(in: &cancellables)
    }

    func testError() throws {
        let mockClass = MockClass()
        let expectation = expectation(description: "Extepcation for testError")
        mockClass.returnValue = .fail(NSError())
        mockClass.returnValue
            .subscribe(on: global)
            .receive(on: main)
            .sink { completion in
            if case .failure = completion {
                expectation.fulfill()
            }
        } receiveValue: { _ in

        }.store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)

    }

    func testExecute() {
        let mockRepository = Mockrepository()
        let mockUseCase = MockUseCase(repository: mockRepository)
        let viewModel = MockViewModel(mockUseCase: mockUseCase)

        viewModel.trigger(.list)

        XCTAssertNotNil(viewModel.state.value)
    }

    private func mockData(_ number: Int) async  -> Data {

        Data()
    }
}

@available(iOS 13.0, *)
class MockClass {

    var returnValue: AnyPublisher<String, Error>!
}

class MockViewModel: ViewModel {

    @Published var state = State()
    var mockUseCase: MockUseCase?

    init(mockUseCase: MockUseCase?) {
        self.mockUseCase = mockUseCase
    }
}

extension MockViewModel {

    enum Input {
        case list
    }

    struct State {
        var value: Int?
    }
    
}

extension MockViewModel {
    func trigger(_ input: Input) {
        switch input {
        case .list:
            self.state.value = mockUseCase?.execute()
        }
    }
}

class MockUseCase: UnwrappedUseCase {
    var repository: Mockrepository?

    init(repository: Mockrepository?) {
        self.repository = repository
    }

    func execute () -> Int {
        do {
            return try execute(repository?.retrieveNumber())
        }catch {
            return .zero
        }

    }
}

class Mockrepository {

    func retrieveNumber() -> Int {
        2
    }
}
