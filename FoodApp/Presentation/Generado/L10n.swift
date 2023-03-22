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
        internal static let title = L10n.tr("Localizable", "Login.Titulo")
        internal static let concepto = L10n.tr("Localizable", "Login.Concepto")
        internal static let capsulaSuperior = L10n.tr("Localizable", "Login.CapsulaSuperio")
        internal static let letraAgua = L10n.tr("Localizable", "Login.LetraDeAgua")
        internal static let capsulaDos = L10n.tr("Localizable", "Login.CapsulaDosSuperior")
        internal static let letraAguaDos = L10n.tr("Localizable", "Login.LetraDeAguaDos")
        internal static let capsulaNaranja = L10n.tr("Localizable", "Login.CapsulaNaranja")
        internal static let letraRoja = L10n.tr("Localizable", "Login.LetraRoja")
    }
    
    internal enum Create {
        internal static let title = L10n.tr("Localizable", "Create.Titulo")
        internal static let concepto = L10n.tr("Localizable", "Create.Concepto")
        internal static let capsulaSuperior = L10n.tr("Localizable", "Create.CapsulaSuperior")
        internal static let letraAgua = L10n.tr("Localizable", "Create.LetraAgua")
        internal static let capsulaDos = L10n.tr("Localizable", "Create.CapsulaDosSuperior")
        internal static let letraDosAgua = L10n.tr("Localizable", "Create.LetraDeAguaDos")
        internal static let capsulaTres = L10n.tr("Localizable", "Create.CapsulaTresSuperior")
        internal static let letraTresAgua = L10n.tr("Localizable", "Create.LetraDeAguaTres")
        internal static let capsulaNaranja = L10n.tr("Localizable", "Create.CapsulaNaranja")
        internal static let letraRoja = L10n.tr("Localizable", "Create.LetraInferior")
    }
    
    internal enum Forgot {
        internal static let titulo = L10n.tr("Localizable", "Forgot.Titulo")
        internal static let concepto = L10n.tr("Localizable", "Forgot.Concepto")
        internal static let email = L10n.tr("Localizable", "Forgot.Email")
        internal static let letraAgua = L10n.tr("Localizable", "Forgot.LetraDeAgua")
        internal static let reiniciar = L10n.tr("Localizable", "Forgot.Reiniciar")
        internal static let letraRoja = L10n.tr("Localizable", "Forgot.LetraRoja")
    }
    
    internal enum Reset {
        internal static let titulo = L10n.tr("Localizable", "Reset.Titulo")
        internal static let concepto = L10n.tr("Localizable", "Reset.Concepto")
        internal static let code = L10n.tr("Localizable", "Reset.Code")
        internal static let capsulaNaranja = L10n.tr("Localizable", "Reset.CapsulaNaranja")
    }
    
    internal enum New {
        internal static let titulo = L10n.tr("Localizable", "New.Titulo")
        internal static let concepto = L10n.tr("Localizable", "New.Concepto")
        internal static let textoSuperior = L10n.tr("Localizable", "New.capsulaSuperior")
        internal static let letraAgua = L10n.tr("Localizable", "New.letraAgua")
        internal static let textoDosSuperior = L10n.tr("Localizable", "New.capsulaSuperiorDos")
        internal static let letraAguaDos = L10n.tr("Localizable", "New.letraAguaDos")
        internal static let capsulanaranja = L10n.tr("Localizable", "New.capsulaNaranja")
    }
    
    internal enum Comun {
        internal static let NombreGoogle = L10n.tr("Localizable", "Comun.LetraGoogle")
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
