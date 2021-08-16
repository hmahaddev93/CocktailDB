//
//
//  Created by Khatib Mahad H. on 7/18/21.
//

import UIKit

final class DrinksViewController: UIViewController {

    private let viewModel: DrinksViewModel
    private let alertPresenter: AlertPresenter_Proto = AlertPresenter()
    private let modalPresenter: ModalPresenter_Proto = ModalPresenter()

    lazy var drinksView = DrinksView()

    init(viewModel: DrinksViewModel = DrinksViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = drinksView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drinksView.tableView.dataSource = self
        drinksView.tableView.delegate = self
        drinksView.searchBar.delegate = self
    }
    
    private func searchDrinksBy(query: String) {
        showSpinner()
        viewModel.fetchDrinks(query: query) {[unowned self] result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.hideSpinner()
                    self.update()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.hideSpinner()
                    self.display(error: error)
                }
            }
            
        }
    }
    
    private func update() {
        drinksView.tableView.reloadData()
    }
    
    private func display(error: Error) {
        alertPresenter.present(from: self,
                               title: "Unexpected Error",
                               message: "\(error.localizedDescription)",
                               dismissButtonTitle: "OK")
    }
    
    private func showSpinner() {
        drinksView.activityIndicatorView.startAnimating()
    }
    
    private func hideSpinner() {
        self.drinksView.activityIndicatorView.stopAnimating()
    }
    
    private func dismissKeyboard() {
        self.drinksView.searchBar.resignFirstResponder()
    }
    
}

extension DrinksViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text, !query.replacingOccurrences(of: " ", with: "").isEmpty {
            searchDrinksBy(query: query)
        }
        else {
            viewModel.drinks.removeAll()
            self.update()
        }
        dismissKeyboard()
    }
}

extension DrinksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.drinks.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 117
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let drinkCell = tableView.dequeueReusableCell(withIdentifier: "DrinkCell", for: indexPath) as? DrinkCell {
            let drink = viewModel.drinks[indexPath.row]
            drinkCell.drink = drink
            return drinkCell
        }
        return UITableViewCell()
    }
}

extension DrinksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .fade)
        let drinkSelected = viewModel.drinks[indexPath.row]
        modalPresenter.present(from: self, destination: DrinkDetailViewController(viewModel: DrinkDetailViewModel(drink: drinkSelected)), animated: true)
    }
}


