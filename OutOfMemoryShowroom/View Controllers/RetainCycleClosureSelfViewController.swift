//  Copyright © 2019 Bastien Falcou. All rights reserved.

import MapKit

final class RetainCycleClosureSelfViewController: UIViewController {
    @IBOutlet private var mapView: MKMapView!

    private var closure: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        closure = {
            print(self.mapView.annotations) // Captures 'self' & generates a retain cycle
        }

        performExpensiveTask()
        mapView.addLotsOfAnnotations()
    }

    deinit {
        print("VC Retain Cycle #1 has been released") // Not reached because view controller never deinited
    }
}
