//
//  JsonHelper.swift
//  
//
//  Created by João Lucas on 26/03/23.
//

import Foundation

private class BundleTestClass {}

public enum JSONHelper {

    public static func loadJSON<Element: Decodable>(
        withFile fileName: String,
        inBundleWithName bundle: String,
        path: String) -> Element? {
            
            let bundle = Bundle.currentModule(name: bundle)
            var jsonData: Element?
            
            if let url = bundle.url(forResource: fileName, withExtension: "json", subdirectory: path) {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    jsonData = try decoder.decode(Element.self, from: data)
                    return jsonData
                } catch {
                    debugPrint(error)
                }
            } else {
                debugPrint("Could not find the json file: \(fileName) in bundle: \(bundle)")
            }
            return nil
        }

    public static func loadData(withFile fileJson: String) -> Data? {
        var data: Data?
        if let url = Bundle(for: BundleTestClass.self).url(forResource: fileJson, withExtension: "json") {
            do {
                data = try Data(contentsOf: url)
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
        return data
    }
}

public extension Foundation.Bundle {
    static func currentModule(name: String) -> Bundle {
        var thisModuleName = name + "_" + name
        var url = Bundle.main.bundleURL

        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            url = bundle.bundleURL.deletingLastPathComponent()
            thisModuleName = thisModuleName.appending("Tests")
        }

        url = url.appendingPathComponent("\(thisModuleName).bundle")

        guard let bundle = Bundle(url: url) else {
            fatalError("Foundation.Bundle.module could not load resource bundle: \(url.path)")
        }

        return bundle
    }
}
