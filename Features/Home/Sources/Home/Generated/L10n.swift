// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Endereço não encontrado
  internal static let addressNotFound = L10n.tr("Localizable", "addressNotFound", fallback: "Endereço não encontrado")
  /// Localizable.strings
  ///   
  /// 
  ///   Created by João Lucas on 10/12/23.
  internal static let deliveryApp = L10n.tr("Localizable", "deliveryApp", fallback: "Delivery App")
  /// Editar
  internal static let edit = L10n.tr("Localizable", "edit", fallback: "Editar")
  /// Erro de conexão
  internal static let messageError = L10n.tr("Localizable", "messageError", fallback: "Erro de conexão")
  /// Padaria . %@-%@ min
  internal static func restaurantDescription(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "restaurantDescription", String(describing: p1), String(describing: p2), fallback: "Padaria . %@-%@ min")
  }
  /// R. Guirantiga, 500
  internal static let setupAddress = L10n.tr("Localizable", "setupAddress", fallback: "R. Guirantiga, 500")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
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
