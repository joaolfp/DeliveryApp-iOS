import XCTest
@testable import Coordinator

final class CoordinatorTests: XCTestCase {

    class MockCoordinatorEvent: CoordinatorEvent {}

    class MockCoordinator: CoordinatorProtocol {
        var handleEventCalled = false
        var startCalled = false

        func handle(event: CoordinatorEvent) {
            handleEventCalled = true
        }

        func start(_ completion: @escaping () -> Void) {
            startCalled = true
            completion()
        }
    }

    func testInit() {
        let parentCoordinator = MockCoordinator()

        let baseCoordinator = BaseCoordinator(parentCoordinator: parentCoordinator)

        XCTAssertNotNil(baseCoordinator)
    }

    func testHandleEvent() {
        let baseCoordinator = BaseCoordinator()
        baseCoordinator.handle(event: MockCoordinatorEvent())
    }

    func testStart() {
        let baseCoordinator = BaseCoordinator()

        let expectation = XCTestExpectation(description: "Completion called")
        baseCoordinator.start {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
