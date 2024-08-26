import UIKit

class MainViewController: UIViewController {

}

func present(_ viewController: UIViewController) {
    let application = UIApplication.shared
    let windowScenes = application.connectedScenes.compactMap { $0 as? UIWindowScene }
    guard let window = windowScenes.first?.keyWindow,
          let rootViewController = window.rootViewController else { return }
    Task.detached { @MainActor in
        rootViewController.present(viewController, animated: true, completion: nil)
    }
}

@_cdecl("main")
public func main() {
    let mainViewController = MainViewController()
    present(mainViewController)
}
