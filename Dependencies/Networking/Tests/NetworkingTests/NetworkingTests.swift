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
        let expectation = self.expectation(description: "Request should succeed")
        
        mock.data = """
        {
            "key": "value"
        }
        """.data(using: .utf8)!
        
        sut.request(request) { (result: Result<MockModel, APIError>) in
            if case let .success(model) = result {
                XCTAssertEqual(model.key, "value")
                expectation.fulfill()
            } else {
                fatalError("Should be a success result")
            }
        }
        
        waitForExpectations(timeout: 1)
    }

    func testVerifyResponseJsonConversionFailure() {
        let expectation = self.expectation(description: "Request should succeed")
        
        mock.data = """
        {
            "key": 1
        }
        """.data(using: .utf8)!
        
        sut.request(request, decode: { json -> Bool in
            json
        }, completion: { result in
            if case let .failure(error) = result {
                XCTAssertEqual(error.localizedDescription, "JSON conversion failure")
                expectation.fulfill()
            } else {
                XCTFail("Should be a failure result")
            }
        })
        
        waitForExpectations(timeout: 1)
    }
    
    func testVerifyResponseInvalidData() {
        let expectation = self.expectation(description: "Request should succeed")
        
        mock.data = nil
        
        sut.request(request, decode: { json -> Bool in
            json
        }, completion: { result in
            if case let .failure(error) = result {
                XCTAssertEqual(error.localizedDescription, "Invalid data")
                expectation.fulfill()
            } else {
                XCTFail("Should be a failure result")
            }
        })
        
        waitForExpectations(timeout: 1)
    }
    
    func testVerifyCancelledError() {
        let expectation = self.expectation(description: "Request should succeed")
        
        mock.response = nil
        mock.error = NSError(domain: NSURLErrorDomain, code: NSURLErrorCancelled, userInfo: nil)
        
        sut.request(request) { (result: Result<MockModel, APIError>) in
            if case let .failure(error) = result {
                XCTAssertEqual(error.localizedDescription, "Request cancelled")
                expectation.fulfill()
            } else {
                fatalError("Should be a success result")
            }
        }
        
        waitForExpectations(timeout: 1)
    }
    
    func testRequestConstruction() {
        let endpoint = MockEndpoint()
        let requestEndpoint = endpoint.request
        
        XCTAssertEqual(requestEndpoint.url?.absoluteString, "https://chapolincolorado.com/nao/contavam/com/minha/astucia?param=value")
        XCTAssertEqual(requestEndpoint.httpMethod, "GET")
    }

    func testVerifyCancellAllRequests() {
        sut.cancelRequests()
        XCTAssertEqual(mock.tasksCancelled, true)
    }
}
