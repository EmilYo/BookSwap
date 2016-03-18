// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import UIKit

extension UIColor {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}

extension UIColor {
  enum Name {
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f5a623"></span>
    /// Alpha: 100% <br/> (0xf5a623ff)
    case First
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#9013fe"></span>
    /// Alpha: 100% <br/> (0x9013feff)
    case Second
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#566d8c"></span>
    /// Alpha: 100% <br/> (0x566d8cff)
    case TabBarIcon
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f26457"></span>
    /// Alpha: 100% <br/> (0xf26457ff)
    case TabBarSelectedIcon
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f26457"></span>
    /// Alpha: 100% <br/> (0xf26457ff)
    case TabBarSelectedText
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#566d8c"></span>
    /// Alpha: 100% <br/> (0x566d8cff)
    case TabBarText

    var rgbaValue: UInt32! {
      switch self {
      case .First: return 0xf5a623ff
      case .Second: return 0x9013feff
      case .TabBarIcon: return 0x566d8cff
      case .TabBarSelectedIcon: return 0xf26457ff
      case .TabBarSelectedText: return 0xf26457ff
      case .TabBarText: return 0x566d8cff
      }
    }

    var color: UIColor {
      return UIColor(named: self)
    }
  }

  convenience init(named name: Name) {
    self.init(rgbaValue: name.rgbaValue)
  }
}
