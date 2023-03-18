//
//  Assets.swift
//  FoodApp
//
//  Created by Ronaldo on 16/03/23.
//

import Foundation
#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#elseif os(tvOS) || os(watchOS)
import UIKit
#endif

internal enum Assets {
    
    internal enum Colours {
        internal static let colorBotonNaranja = ColorAsset(name: "ColorBotonNaranja")
        internal static let colorBlancoPantalla = ColorAsset(name: "ColorFondoPantalla")
        internal static let colorPlomeado = ColorAsset(name: "ColorLetrasPequeñas")
        internal static let colorBordeTextInput = ColorAsset(name: "BordeDeTextInput")
        internal static let colorPlaceHolder = ColorAsset(name: "ColorPlaceHolder")
    }
    
    internal enum Bienvenida {
        internal static let primeraImagen = ImageAsset(name: "BienvenidaUno")
        internal static let segundaImagen = ImageAsset(name: "BienvenidaDos")
        internal static let terceraImagen = ImageAsset(name: "BienvenidaTres")
    }
    
    internal enum Comun {
        internal static let logoPrincipal = ImageAsset(name: "LogoPrincipal")
        internal static let iconoGoogle = ImageAsset(name: "IconoGoogle")
    }
    
}


// MARK: - Implementation Details
internal final class ColorAsset {
    internal fileprivate(set) var name: String
    
#if os(macOS)
    internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
    internal typealias Color = UIColor
#endif
    
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    internal private(set) lazy var color: Color = Color(asset: self)
    
    fileprivate init(name: String) {
        self.name = name
    }
}

internal extension ColorAsset.Color {
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    convenience init!(asset: ColorAsset) {
        let bundle = BundleToken.bundle
#if os(iOS) || os(tvOS)
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
#elseif os(macOS)
        self.init(named: NSColor.Name(asset.name), bundle: bundle)
#elseif os(watchOS)
        self.init(named: asset.name)
#endif
    }
}


internal struct ImageAsset {
    internal fileprivate(set) var name: String
    
#if os(macOS)
    internal typealias Image = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
    internal typealias Image = UIImage
#endif
    
    internal var image: Image {
        let bundle = BundleToken.bundle
#if os(iOS) || os(tvOS)
        let image = Image(named: name, in: bundle, compatibleWith: nil)
#elseif os(macOS)
        let name = NSImage.Name(self.name)
        let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
#elseif os(watchOS)
        let image = Image(named: name)
#endif
        guard let result = image else {
            fatalError("Unable to load image named \(name).")
        }
        return result
    }
}

internal extension ImageAsset.Image {
    @available(macOS, deprecated,
               message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
    convenience init!(asset: ImageAsset) {
#if os(iOS) || os(tvOS)
        let bundle = BundleToken.bundle
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
#elseif os(macOS)
        self.init(named: NSImage.Name(asset.name))
#elseif os(watchOS)
        self.init(named: asset.name)
#endif
    }
}

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
#if SWIFT_PACKAGE
        return Bundle.module
#else
        return Bundle(for: BundleToken.self)
#endif
    }()
}
