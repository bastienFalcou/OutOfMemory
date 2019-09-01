//  Copyright © 2019 Bastien Falcou. All rights reserved.

import UIKit

class RetainCycleClosureOtherViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        performExpensiveTask()

        let searchBarModel = SearchBarModel()
        let searchBar = SearchBar(viewModel: searchBarModel)

        searchBarModel.onReturn = {
            searchBar.backgroundColor = .red // Captures 'searchBar' & generates a retain cycle
        }
        view.addSubview(searchBar)
    }

    deinit {
        print("VC Retain Cycle #2 has been released")
    }
}

class SearchBar: UIView {
    private let viewModel: SearchBarModel

    init(viewModel: SearchBarModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SearchBarModel {
    var onReturn: (() -> Void)?
}
