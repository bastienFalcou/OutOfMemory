//  Copyright © 2019 Bastien Falcou. All rights reserved.

import MapKit

extension UIViewController {
    func performExpensiveTask() { // TODO: Show how this also needs to be weakified
        DispatchQueue.global(qos: .background).async { [weak self] in
            _ = Data.init(repeating: 100, count: 1200000000) // Allocates 1.2 GB of ram
            self?.performExpensiveTask()
        }
    }
}

extension MKMapView {
    func addLotsOfAnnotations() {
        (0..<1000).forEach { index in
            let annotation = MKPointAnnotation()
            annotation.coordinate = centerCoordinate
            addAnnotation(annotation)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.addLotsOfAnnotations()
        }
    }
}
