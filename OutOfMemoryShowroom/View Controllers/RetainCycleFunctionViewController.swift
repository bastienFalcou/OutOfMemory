//
//  RetainCycleFunctionViewController.swift
//  OutOfMemoryShowroom
//
//  Created by Bastien Falcou on 8/4/19.
//  Copyright © 2019 Bastien Falcou. All rights reserved.
//

import UIKit

final class View {
    var onButtonPressed: (()-> Void)?
}

final class RetainCycleFunctionViewController: UIViewController {
    private let customView = View()

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.onButtonPressed = handleButtonAction

        print(UIApplication.shared.keyWindow?.rootViewController?.topDownHierarchyDescription ?? "none")
    }

    private func handleButtonAction() {
        print(self.description) // Captures 'self' & generates a retain cycle
    }
}
