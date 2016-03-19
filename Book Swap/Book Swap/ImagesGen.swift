// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import UIKit

extension UIImage {
  enum Asset: String {
    case Book_1 = "Book_1"
    case Book_2 = "Book_2"
    case Book_3 = "Book_3"
    case Book_4 = "Book_4"
    case BookSwap = "BookSwap"
    case BtnLike = "BtnLike"
    case BtnSkip = "BtnSkip"
    case Cards_1 = "cards_1"
    case Cards_2 = "cards_2"
    case Cards_3 = "cards_3"
    case Cards_4 = "cards_4"
    case Cards_5 = "cards_5"
    case Ic_card_from_bg = "ic_card_from_bg"
    case Ic_koloda = "ic_koloda"
    case Ic_like = "ic_like"
    case Ic_skip = "ic_skip"
    case Ic_undo = "ic_undo"
    case Overlay_like = "overlay_like"
    case Overlay_skip = "overlay_skip"
    case Mail = "mail"
    case NoOverlayImage = "noOverlayImage"
    case TabAccount = "TabAccount"
    case TabMatch = "TabMatch"
    case TabMyBooks = "TabMyBooks"
    case TabSwap = "TabSwap"
    case TabWanted = "TabWanted"
    case YesOverlayImage = "yesOverlayImage"

    var image: UIImage {
      return UIImage(asset: self)
    }
  }

  convenience init!(asset: Asset) {
    self.init(named: asset.rawValue)
  }
}
