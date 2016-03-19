// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: nil)
  }

  static func initialViewController() -> UIViewController {
    return storyboard().instantiateInitialViewController()!
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewControllerWithIdentifier(self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func performSegue<S: StoryboardSegueType where S.RawValue == String>(segue: S, sender: AnyObject? = nil) {
    performSegueWithIdentifier(segue.rawValue, sender: sender)
  }
}

struct StoryboardScene {
  enum LaunchScreen: StoryboardSceneType {
    static let storyboardName = "LaunchScreen"
  }
  enum Login: String, StoryboardSceneType {
    static let storyboardName = "Login"

    case LoginNavigationControllerScene = "LoginNavigationController"
    static func instantiateLoginNavigationController() -> LoginNavigationController {
      return StoryboardScene.Login.LoginNavigationControllerScene.viewController() as! LoginNavigationController
    }
  }
  enum Main: StoryboardSceneType {
    static let storyboardName = "Main"
  }
  enum Match: String, StoryboardSceneType {
    static let storyboardName = "Match"

    case MatchNavigationControllerScene = "MatchNavigationController"
    static func instantiateMatchNavigationController() -> MatchNavigationController {
      return StoryboardScene.Match.MatchNavigationControllerScene.viewController() as! MatchNavigationController
    }
  }
  enum MyBooks: String, StoryboardSceneType {
    static let storyboardName = "MyBooks"

    case MyBooksNavigationControllerScene = "MyBooksNavigationController"
    static func instantiateMyBooksNavigationController() -> MyBooksNavigationController {
      return StoryboardScene.MyBooks.MyBooksNavigationControllerScene.viewController() as! MyBooksNavigationController
    }

    case MyBooksViewControllerScene = "MyBooksViewController"
    static func instantiateMyBooksViewController() -> MyBooksViewController {
      return StoryboardScene.MyBooks.MyBooksViewControllerScene.viewController() as! MyBooksViewController
    }
  }
  enum Profile: String, StoryboardSceneType {
    static let storyboardName = "Profile"

    case ProfileNavigationControllerScene = "ProfileNavigationController"
    static func instantiateProfileNavigationController() -> ProfileNavigationController {
      return StoryboardScene.Profile.ProfileNavigationControllerScene.viewController() as! ProfileNavigationController
    }
  }
  enum Swap: String, StoryboardSceneType {
    static let storyboardName = "Swap"

    case SwapNavigationControllerScene = "SwapNavigationController"
    static func instantiateSwapNavigationController() -> SwapNavigationController {
      return StoryboardScene.Swap.SwapNavigationControllerScene.viewController() as! SwapNavigationController
    }
  }
  enum Wanted: String, StoryboardSceneType {
    static let storyboardName = "Wanted"

    case WantedNavigationControllerScene = "WantedNavigationController"
    static func instantiateWantedNavigationController() -> WantedNavigationController {
      return StoryboardScene.Wanted.WantedNavigationControllerScene.viewController() as! WantedNavigationController
    }

    case WantedViewControllerScene = "WantedViewController"
    static func instantiateWantedViewController() -> WantedViewController {
      return StoryboardScene.Wanted.WantedViewControllerScene.viewController() as! WantedViewController
    }
  }
}

struct StoryboardSegue {
  enum MyBooks: String, StoryboardSegueType {
    case PresentAddBookNavigationController = "PresentAddBookNavigationController"
  }
}
