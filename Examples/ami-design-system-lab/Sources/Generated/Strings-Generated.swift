// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum AMIL10n {
  /// Retour
  internal static let commonBack = AMIL10n.tr("Localizable", "common_back", fallback: "Retour")
  /// Annuler
  internal static let commonCancel = AMIL10n.tr("Localizable", "common_cancel", fallback: "Annuler")
  /// Fermer
  internal static let commonClose = AMIL10n.tr("Localizable", "common_close", fallback: "Fermer")
  /// Erreur
  internal static let commonError = AMIL10n.tr("Localizable", "common_error", fallback: "Erreur")
  /// Ok
  internal static let commonOk = AMIL10n.tr("Localizable", "common_ok", fallback: "Ok")
  /// Plural format key: "%#@VARIABLE@"
  internal static func homesFound(_ p1: Int) -> String {
    return AMIL10n.tr("Localizable", "Homes found", p1, fallback: "Plural format key: \"%#@VARIABLE@\"")
  }
  /// Impossible d'accéder aux logs
  internal static let logsErrorUnableToAccessLog = AMIL10n.tr("Localizable", "logs_error_unable_to_access_log", fallback: "Impossible d'accéder aux logs")
  /// Impossible d'enregistrer le fichier de logs
  internal static let logsErrorUnableToWriteLog = AMIL10n.tr("Localizable", "logs_error_unable_to_write_log", fallback: "Impossible d'enregistrer le fichier de logs")
  /// Recevoir les notifications sur mon appareil mobile
  internal static let settingsNotificationsAllowTitle = AMIL10n.tr("Localizable", "settings_notifications_allow_title", fallback: "Recevoir les notifications sur mon appareil mobile")
  /// Paramètres
  internal static let settingsTitle = AMIL10n.tr("Localizable", "settings_title", fallback: "Paramètres")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension AMIL10n {
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
