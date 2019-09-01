//  Copyright © 2019 Bastien Falcou. All rights reserved.

import UIKit

final class View {
    var onButtonPressed: (()-> Void)?
}

final class RetainCycleFunctionViewController: UIViewController {
    private let customView = View()

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.onButtonPressed = handleButtonAction
    }

    private func handleButtonAction() {
        print(self.description) // Captures 'self' & generates a retain cycle
    }
}
