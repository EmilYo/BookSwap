// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation

enum L10n {
  /// Mam
  case LocTabMyBooks
  /// Moje książki
  case LocMyBooksTitle
  /// Chcę
  case LocTabWanted
  /// Chcę książki
  case LocWantedTitle
  /// Odkryj
  case LocTabSwap
  /// Odkryj
  case LocSwapTitle
  /// Wymiany
  case LocTabMatch
  /// Wymiany
  case LocMatchTitle
  /// Profil
  case LocTabProfile
  /// Profil
  case LocProfileTitle
  /// Login
  case LocLoginTitle
  /// Dodaj książkę
  case LocAddBookTitle
  /// Wymieniaj książki z ludźmi z twoje okolicy.
  case LocLoginLabel
  /// Uwaga!
  case LocWarning
  /// Tak
  case LocYes
  /// Nie
  case LocNo
  /// Czy napewno chcesz usunąć tą książkę?
  case LocTrashBookMessage
  /// Dodaj książki
  case LocMyBooksEmpty
  /// Znajdź interesujące Cię książki
  case LocWantedEmpty
  /// Brak ksiązek w okolicy
  case LocSwapEmpty
  /// Możliwa wymiana \"%@\" za \"%@\" z użytkownikiem %@.
  case LocMatchLabel(String, String, String)
}

extension L10n: CustomStringConvertible {
  var description: String { return self.string }

  var string: String {
    switch self {
      case .LocTabMyBooks:
        return L10n.tr("loc_tab_my_books")
      case .LocMyBooksTitle:
        return L10n.tr("loc_my_books_title")
      case .LocTabWanted:
        return L10n.tr("loc_tab_wanted")
      case .LocWantedTitle:
        return L10n.tr("loc_wanted_title")
      case .LocTabSwap:
        return L10n.tr("loc_tab_swap")
      case .LocSwapTitle:
        return L10n.tr("loc_swap_title")
      case .LocTabMatch:
        return L10n.tr("loc_tab_match")
      case .LocMatchTitle:
        return L10n.tr("loc_match_title")
      case .LocTabProfile:
        return L10n.tr("loc_tab_profile")
      case .LocProfileTitle:
        return L10n.tr("loc_profile_title")
      case .LocLoginTitle:
        return L10n.tr("loc_login_title")
      case .LocAddBookTitle:
        return L10n.tr("loc_add_book_title")
      case .LocLoginLabel:
        return L10n.tr("loc_login_label")
      case .LocWarning:
        return L10n.tr("loc_warning")
      case .LocYes:
        return L10n.tr("loc_yes")
      case .LocNo:
        return L10n.tr("loc_no")
      case .LocTrashBookMessage:
        return L10n.tr("loc_trash_book_message")
      case .LocMyBooksEmpty:
        return L10n.tr("loc_my_books_empty")
      case .LocWantedEmpty:
        return L10n.tr("loc_wanted_empty")
      case .LocSwapEmpty:
        return L10n.tr("loc_swap_empty")
      case .LocMatchLabel(let p0, let p1, let p2):
        return L10n.tr("loc_match_label", p0, p1, p2)
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
