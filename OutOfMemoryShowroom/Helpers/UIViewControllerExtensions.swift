//
//  UIViewControllerExtensions.swift
//  OutOfMemoryShowroom
//
//  Created by Bastien Falcou on 6/23/19.
//  Copyright © 2019 Bastien Falcou. All rights reserved.
//

import UIKit

extension UIViewController {
    func performExpensiveTask() { // TODO: Show how this also needs to be weakified
        DispatchQueue.global(qos: .background).async { [weak self] in
            _ = Data.init(repeating: 100, count: 1200000000) // Allocates 1.2 GB of ram
            self?.performExpensiveTask()
        }
    }
}
