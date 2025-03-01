//
//  Logger.swift
//
//
//  Created by João Lucas on 09/07/23.
//

import Foundation

final class Logger {

    func buildLogger(data: Data, response: URLResponse?) {
        header(response: response)

        if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
            print(String(decoding: jsonData, as: UTF8.self))
        } else {
            print("❌ Json data malformed")
        }
    }

    private func header(response: URLResponse?) {
        print("---- 🌎 Networking 🌏 ----")

        if let response = response as? HTTPURLResponse, let url = response.url {
            print("➡️ URL: \(url.absoluteString)")
            validateStatusCode(response: response)
            print("⬇️ Result")
        }
    }

    private func validateStatusCode(response: HTTPURLResponse) {
        response.statusCode == 200 ? print("✅ status code: 200") : print("⚠️ status code: \(response.statusCode)")
    }
}
