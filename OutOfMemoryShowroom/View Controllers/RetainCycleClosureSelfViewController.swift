//  Copyright © 2019 Bastien Falcou. All rights reserved.

import UIKit

class RetainCycleClosureSelfViewController: UIViewController {
    private var closure: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        performExpensiveTask()

        closure = {
            print(self.description) // Captures 'self' & generates a retain cycle
        }
    }

    deinit {
        print("VC Retain Cycle #1 has been released")
    }
}
