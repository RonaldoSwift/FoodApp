//
//  L10n.swift
//  FoodApp
//
//  Created by Ronaldo on 16/03/23.
//

import Foundation


internal enum L10n {
    
    internal enum Bienvenida {
        
        internal static let tituloSlideUno = L10n.tr("Localizable", "Bienvenida.SlideUno.Titulo")
        internal static let tituloSlideDos = L10n.tr("Localizable", "Bienvenida.SlideDos.Titulo")
        internal static let tituloSlideTres = L10n.tr("Localizable", "Bienvenida.SlideTres.Titulo")
        
    }
    
    internal enum Login {
        internal static let title = L10n.tr("Localizable", "Login.Title")
    }
    
    internal enum Registro {
        internal static let title = L10n.tr("Localizable", "Registro.Title")
        
    }
    
    
    internal enum MiCuenta {
        
    }
    
}

// MARK: - Implementation Details
extension L10n {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
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
// swiftlint:enable convenience_type
