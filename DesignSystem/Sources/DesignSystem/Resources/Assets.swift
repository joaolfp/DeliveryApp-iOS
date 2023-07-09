//
//  UIAssets.swift
//  
//
//  Created by João Lucas on 25/03/23.
//

import UIKit

public enum UIAssets {
    public enum Home {
        public static let restaurant = ImageAsset(name: "Home/restaurant-logo")
        public static let pizza = ImageAsset(name: "Home/pizza")
    }
    
    public enum Error {
        public static let error = ImageAsset(name: "Error/error")
    }
}

public struct ImageAsset {
    public fileprivate(set) var name: String

    public typealias Image = UIImage
    
    @available(iOS 8.0, *)
    public var image: Image {
        let bundle = BundleToken.bundle
        let image = Image(named: name, in: bundle, compatibleWith: nil)
        guard let result = image else {
            fatalError("Unable to load image asset named \(name).")
        }
        return result
    }
    
    @available(iOS 8.0, *)
    public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
        let bundle = BundleToken.bundle
        guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
            fatalError("Unable to load image asset named \(name).")
        }
        return result
    }
}

public extension ImageAsset.Image {
    @available(iOS 8.0, *)
    convenience init!(asset: ImageAsset) {
        let bundle = BundleToken.bundle
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
    }
}

private final class BundleToken {
    static let bundle: Bundle = {
#if SWIFT_PACKAGE
        return Bundle.module
#else
        return Bundle(for: BundleToken.self)
#endif
    }()
}
