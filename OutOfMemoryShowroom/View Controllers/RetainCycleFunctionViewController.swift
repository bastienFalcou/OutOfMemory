//  Copyright © 2019 Bastien Falcou. All rights reserved.

import UIKit

final class View {
    var onButtonPressed: (()-> Void)?
}

final class RetainCycleFunctionViewController: UIViewController {
    private let customView = View()

    override func viewDidLoad() {
        super.viewDidLoad()
        performExpensiveTask()

        customView.onButtonPressed = handleButtonAction // Captures 'self' & generates a retain cycle
    }

    private func handleButtonAction() {
        print(description)
    }

    deinit {
        print("VC Retain Cycle #3 has been released")
    }
}
