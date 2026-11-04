import HotwireNative
import UIKit

// The screen that shows each web page. It only adds one thing to Hotwire's own: a Cancel button
// on the first screen of a modal, so there's always a way to close it. (Pages open as modals when
// a path configuration rule says so.)
final class WebViewController: HotwireWebViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if navigationItem.leftBarButtonItem == nil,
            presentingViewController != nil,
            navigationController?.viewControllers.first === self
        {
            let cancel = UIAction { [weak self] _ in
                self?.dismiss(animated: true)
            }
            navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .cancel, primaryAction: cancel)
        }
    }
}
