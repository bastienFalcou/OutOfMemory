//  Copyright © 2019 Bastien Falcou. All rights reserved.

import UIKit

public class NavigationController: UINavigationController {
    @IBInspectable var isRetainCycleSafetyEnabled: Bool = false

    public override func popViewController(animated: Bool) -> UIViewController? {
        let viewController = super.popViewController(animated: animated)
        #if DEBUG
            if isRetainCycleSafetyEnabled {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak viewController] in
                    if let viewController = viewController {
                        fatalError("VC Not Deallocated: \(String(describing: viewController.classForCoder)))")
                    }
                }
            }
        #endif
        return viewController
    }
}
