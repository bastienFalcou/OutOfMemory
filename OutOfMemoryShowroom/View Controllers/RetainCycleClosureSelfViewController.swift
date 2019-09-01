//  Copyright © 2019 Bastien Falcou. All rights reserved.

import MapKit

final class RetainCycleClosureSelfViewController: UIViewController {
    private var closure: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        closure = {
            print(self.mapView.annotations) // Captures 'self' & generates a retain cycle
        }

        performExpensiveTask()
    }

    deinit {
        print("VC Retain Cycle #1 has been released") // Not reached because view controller never deinited
    }
}
