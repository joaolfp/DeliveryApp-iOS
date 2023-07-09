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
            print("json data malformed")
        }
    }
    
    private func header(response: URLResponse?) {
        debugPrint("--- 🌎 Networking 🌏 --")
        
        if let response = response as? HTTPURLResponse, let url = response.url {
            debugPrint("URL: \(url.absoluteString)")
            debugPrint("status code: \(response.statusCode)")
        }
    }
}
