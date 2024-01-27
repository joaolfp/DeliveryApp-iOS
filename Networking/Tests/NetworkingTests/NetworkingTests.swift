import XCTest
@testable import Networking

struct Breed: Codable {
    var bool: Bool
}

final class NetworkingTests: XCTestCase {

    var sut: APIClient!
    var mock: URLSessionMock!
    var request: URLRequest!

    override func setUp() {
        super.setUp()

        mock = URLSessionMock()
        sut = APIClient(session: mock)
        request = URLRequest(url: URL(string: "http://breeds.com")!)
        request.httpMethod = APIMethod.get.toString()
    }

    override func tearDown() {
        super.tearDown()

        mock = nil
        sut = nil
        request = nil
    }

    func testVerifyRequestWithSuccess() {
        mock.data = "{\"bool\": true}".data(using: .utf8)

        sut.request(request, decode: { breed -> Breed in
            var value = breed
            value.bool = breed.bool
            return value
        }, completion: { result in
            if case let .success(breed) = result {
                XCTAssertEqual(breed.bool, true)
            } else {
                XCTFail("Should be a success result")
            }
        })
    }

    func testVerifyRequestWithFailure() {
        mock.data = "{\"value\": 123}".data(using: .utf8)

        sut.request(request, decode: { json -> Bool in
            json
        }, completion: { result in
            if case let .failure(error) = result {
                XCTAssertEqual(error.localizedDescription, "JSON conversion failure")
            } else {
                XCTFail("Should be a failure result")
            }
        })
    }

    func testVerifyCancellAllRequests() {
        sut.cancelRequests()
        XCTAssertEqual(mock.tasksCancelled, true)
    }
}
