//
//  UIViewControllerExtensions.swift
//  OutOfMemoryShowroom
//
//  Created by Bastien Falcou on 6/23/19.
//  Copyright © 2019 Bastien Falcou. All rights reserved.
//

import MapKit

extension UIViewController {
    func performExpensiveTask() { // TODO: Show how this also needs to be weakified
        DispatchQueue.global(qos: .background).async { [weak self] in
            _ = Data.init(repeating: 100, count: 1200000000) // Allocates 1.2 GB of ram
            self?.performExpensiveTask()
        }
    }

    var topDownHierarchyDescription: String? {
        let baseString = "--\(String(describing: navigationController)):"

        if let navigationController = self as? UINavigationController {
            return baseString + navigationController.viewControllers
                .map { "\n----\($0.topDownHierarchyDescription ?? "")" }
                .joined(separator: "")
        }
        if let tabBarController = self as? UITabBarController {
            return baseString + (tabBarController.viewControllers?
                .map { "\n----\($0.topDownHierarchyDescription ?? "")" }
                .joined(separator: "") ?? "")
        }
        if let splitViewController = self as? UISplitViewController {
            return baseString + splitViewController.viewControllers
                .map { "\n----\($0.topDownHierarchyDescription ?? "")" }
                .joined(separator: "")
        }
        if let presentedViewController = self.presentedViewController {
            return baseString + "\n----\(presentedViewController.topDownHierarchyDescription ?? "")"
        }
        return nil
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
