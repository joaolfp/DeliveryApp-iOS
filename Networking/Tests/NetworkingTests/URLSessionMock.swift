//
//  URLSessionMock.swift
//
//
//  Created by João Lucas on 26/03/23.
//

import Foundation

final class URLSessionMock: URLSession {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    typealias CancelCompletionHandler = ([URLSessionDataTask], [URLSessionUploadTask], [URLSessionDownloadTask]) -> Void

    var data: Data?
    var error: Error?
    var statusCode: Int = 200
    var tasksCancelled: Bool = false

    lazy var response: HTTPURLResponse? = {
        let response = HTTPURLResponse(
            url: URL(string: "http://breeds.com")!,
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )
        return response
    }()

    override func dataTask(with request: URLRequest, completionHandler: @escaping CompletionHandler) -> URLSessionDataTask {
        URLSessionDataTaskMock { [weak self] in
            completionHandler(self?.data, self?.response, self?.error)
        }
    }

    override func getTasksWithCompletionHandler(_ completionHandler: @escaping CancelCompletionHandler) {
        tasksCancelled = true
        completionHandler([URLSessionDataTask](), [URLSessionUploadTask](), [URLSessionDownloadTask]())
    }
}

final class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}
