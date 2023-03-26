import Foundation
import Quick
import Nimble
@testable import Networking

struct Breed: Codable {
    var bool: Bool
}

final class NetworkingTests: QuickSpec {
    override func spec() {
        describe("Networking") {
            
            var sut: APIClient!
            var mock: URLSessionMock!
            var request: URLRequest!
            
            beforeEach {
                mock = URLSessionMock()
                sut = APIClient(session: mock)
                request = URLRequest(url: URL(string: "http://breeds.com")!)
                request.httpMethod = APIMethod.get.toString()
            }
            
            it("verify request with success") {
                mock.data = "{\"bool\": true}".data(using: .utf8)
                
                sut.request(request, decode: { breed -> Breed in
                    var value = breed
                    value.bool = breed.bool
                    return value
                }, completion: { result in
                    if case let .success(breed) = result {
                        expect(breed.bool).to(beTrue())
                    } else {
                        fail("Should be a success result")
                    }
                })
            }
            
            it("verify request with failure") {
                mock.data = "{\"value\": 123}".data(using: .utf8)
                
                sut.request(request, decode: { json -> Bool in
                    json
                }, completion: { result in
                    if case let .failure(error) = result {
                        expect(error.localizedDescription).to(equal("JSON conversion failure"))
                    } else {
                        fail("Should be a failure result")
                    }
                })
            }
            
            it("verify cancell all requests") {
                sut.cancelRequests()
                expect(mock.tasksCancelled).to(equal(true))
            }
        }
    }
}
