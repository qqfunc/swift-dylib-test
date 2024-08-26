import Concurrency
import UIKit

class MainViewController: UIViewController {

}

func present(_ viewController: UIViewController) {
    let app = UIApplication.shared
    let window = app.connectedScenes.compactMap({ $0 as? UIWindowScene }).first?.keyWindow
    let rootViewController = window.rootViewController
    Task.detached { @MainActor in
        rootViewController.present(viewController, animated: true, completion: nil)
    }
}

@_cdecl("main")
public func main() {
    let mainViewController = MainViewController()
    present(mainViewController)
}
