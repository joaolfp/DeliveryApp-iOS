//
//  APIClient.swift
//
//
//  Created by João Lucas on 25/03/23.
//

import Foundation

public final class APIClient: APIClientProtocol {

    private let session: URLSession
    private let interceptor: RequestInterceptor

    public init(session: URLSession = .shared, 
                interceptor: RequestInterceptor = RequestInterceptor()) {
        self.session = session
        self.interceptor = interceptor
    }
}

extension APIClient {

    typealias DecodingCompletionHandler = (Decodable?, APIError?) -> Void

    private func decodingTask<T: Decodable>(with request: URLRequest,
                                            decodingType: T.Type,
                                            completionHandler completion: @escaping (T?, APIError?) -> Void) -> URLSessionDataTask {

        let task = session.dataTask(with: request) { data, response, error in

            guard let httpResponse = response as? HTTPURLResponse else {
                self.errorHandling(response: response, error: error, completion: completion)
                return
            }
            switch httpResponse.statusCode {
            case 200 ... 399:
                self.validationData(data: data, decodingType: decodingType, completion: completion)

                guard let data else { return }
                let logger = Logger()
                logger.buildLogger(data: data, response: response)
            default:
                completion(nil, .responseUnsuccessful)
            }
        }
        return task
    }

    public func request<T: Decodable>(_ request: URLRequest, decode: ((T) -> T)?, completion: @escaping (Result<T, APIError>) -> Void) {
        
        let interceptedRequest = interceptor.intercept(request)

        let task = decodingTask(with: interceptedRequest, decodingType: T.self) { json, error in

            DispatchQueue.main.async {
                if let error {
                    completion(.failure(error))
                    return
                }
                if let json {
                    if let value = decode?(json) {
                        completion(.success(value))
                    } else {
                        completion(.success(json))
                    }
                }
            }
        }
        
        task.resume()
    }

    private func errorHandling<T: Decodable>(response: URLResponse?, error: Error?, completion: @escaping (T?, APIError?) -> Void) {
        if let error = error as NSError?, error.domain == NSURLErrorDomain, error.code == NSURLErrorCancelled {
            completion(nil, .requestCancelled)
        } else {
            completion(nil, .requestFailed(reason: error?.localizedDescription))
        }
    }

    private func validationData<T: Decodable>(data: Data?, decodingType: T.Type, completion: @escaping (T?, APIError?) -> Void) {
        if let data {
            jsonDecoder(completion: completion, decodingType: decodingType, data: data)
        } else {
            completion(nil, .invalidData)
        }
    }

    private func jsonDecoder<T: Decodable>(completion: @escaping (T?, APIError?) -> Void, decodingType: T.Type, data: Data) {
        do {
            let model = try JSONDecoder().decode(decodingType, from: data)
            completion(model, nil)
        } catch {
            completion(nil, .jsonConversionFailure)
        }
    }

    public func cancelRequests() {
        session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach { $0.cancel() }
            uploadTasks.forEach { $0.cancel() }
            downloadTasks.forEach { $0.cancel() }
        }
    }
}
