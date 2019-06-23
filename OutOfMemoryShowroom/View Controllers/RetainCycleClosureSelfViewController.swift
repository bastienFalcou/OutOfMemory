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

        closure = {
            self.label.textColor = .black // Captures 'self' & generates a retain cycle
        }

        performExpensiveTask()
    }

    deinit {
        print("VC Retain Cycle #1 has been released") // Not reached because view controller never deinited
    }
}
