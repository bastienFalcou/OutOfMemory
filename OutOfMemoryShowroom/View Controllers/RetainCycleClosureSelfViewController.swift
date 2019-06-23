//
//  RetainCycleClosureSelfViewController.swift
//  OutOfMemoryShowroom
//
//  Created by Bastien Falcou on 6/23/19.
//  Copyright © 2019 Bastien Falcou. All rights reserved.
//

import UIKit

final class RetainCycleClosureSelfViewController: UIViewController {
    @IBOutlet private var label: UILabel!

    private var closure: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // This closure captures 'self' and generates a retain cycle
        closure = { self.label.textColor = .black }
    }

    deinit {
        // This print is not displayed because this view controller never deinited
        print("RetainCycleClosureSelfViewController has been released")
    }
}
