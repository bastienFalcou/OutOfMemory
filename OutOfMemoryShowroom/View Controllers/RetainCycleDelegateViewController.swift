//  Copyright © 2019 Bastien Falcou. All rights reserved.

import UIKit

class RetainCycleDelegateViewController: UIViewController, ChildViewControllerProtocol {
    let childViewController = ChildViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        performExpensiveTask()

        childViewController.delegate = self
    }
}

protocol ChildViewControllerProtocol: class {}

class ChildViewController: UIViewController {
    var delegate: ChildViewControllerProtocol? // Captures 'RetainCycleDelegateViewController' & generates a retain cycle
}
