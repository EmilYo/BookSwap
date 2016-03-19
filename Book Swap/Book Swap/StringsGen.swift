// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation

enum L10n {
  /// My Books
  case LocTabMyBooks
  /// Wanted
  case LocTabWanted
  /// Swap
  case LocTabSwap
  /// Match
  case LocTabMatch
  /// Profile
  case LocTabProfile
  /// Login
  case LocLoginTitle
  /// Add book
  case LocAddBookTitle
  /// Warning!
  case LocWarning
  /// Tak
  case LocYes
  /// Nie
  case LocNo
  /// Czy napewno chcesz usunąć tą książkę?
  case LocTrashBookMessage
}

extension L10n: CustomStringConvertible {
  var description: String { return self.string }

  var string: String {
    switch self {
      case .LocTabMyBooks:
        return L10n.tr("loc_tab_my_books")
      case .LocTabWanted:
        return L10n.tr("loc_tab_wanted")
      case .LocTabSwap:
        return L10n.tr("loc_tab_swap")
      case .LocTabMatch:
        return L10n.tr("loc_tab_match")
      case .LocTabProfile:
        return L10n.tr("loc_tab_profile")
      case .LocLoginTitle:
        return L10n.tr("loc_login_title")
      case .LocAddBookTitle:
        return L10n.tr("loc_add_book_title")
      case .LocWarning:
        return L10n.tr("loc_warning")
      case .LocYes:
        return L10n.tr("loc_yes")
      case .LocNo:
        return L10n.tr("loc_no")
      case .LocTrashBookMessage:
        return L10n.tr("loc_trash_book_message")
    }
  }

  private static func tr(key: String, _ args: CVarArgType...) -> String {
    let format = NSLocalizedString(key, comment: "")
    return String(format: format, locale: NSLocale.currentLocale(), arguments: args)
  }
}

func tr(key: L10n) -> String {
  return key.string
}
