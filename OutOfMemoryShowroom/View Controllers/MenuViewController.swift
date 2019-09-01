//  Copyright © 2019 Bastien Falcou. All rights reserved.

import UIKit

final class MenuViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!

    private let viewModel = MenuViewModel()
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = viewModel.options[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: viewModel.options[indexPath.row].segueIdentifier, sender: self)
    }
}
