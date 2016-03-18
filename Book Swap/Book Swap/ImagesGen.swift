// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import UIKit

extension UIImage {
  enum Asset: String {
    case BookSwap = "BookSwap"
    case TabAccount = "TabAccount"
    case TabMatch = "TabMatch"
    case TabMyBooks = "TabMyBooks"
    case TabSwap = "TabSwap"
    case TabWanted = "TabWanted"

    var image: UIImage {
      return UIImage(asset: self)
    }
  }

  convenience init!(asset: Asset) {
    self.init(named: asset.rawValue)
  }
}
