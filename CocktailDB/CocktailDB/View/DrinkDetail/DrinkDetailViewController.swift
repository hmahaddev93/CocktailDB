//
//  DrinkDetailViewController.swift
//  CocktailDB
//
//  Created by Khatib Mahad H. on 8/16/21.
//

import UIKit

import UIKit

final class DrinkDetailViewController: UIViewController {

    static let reuseDefaultCellIdentifier = "DefaultCell"
    static let reuseImagesCellIdentifier = "DrinkImageCell"
    static let reuseTextCellIdentifier = "TextCell"

    private let modalPresenter: ModalPresenter_Proto = ModalPresenter()
    private let viewModel: DrinkDetailViewModel
    lazy var detailView = DrinkDetailView()
    
    enum TableViewSection: Int, CaseIterable {
        case image
        case instructions
        case ingredients
        case glass
    }

    init(viewModel: DrinkDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView.nameLabel.text = viewModel.drink.name
        detailView.closeDetailViewHandler = { [unowned self] in
            modalPresenter.dismiss(from: self, animated: true)
        }
        detailView.tableView.dataSource = self
        detailView.tableView.delegate = self
    }
    
    private func update() {
        detailView.tableView.reloadData()
    }
}

extension DrinkDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        TableViewSection.allCases.count
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tableViewSection = TableViewSection(rawValue: section) else { return 0 }
        
        switch tableViewSection {
        case .image, .instructions, .glass:
            return 1
        case .ingredients:
            return viewModel.ingredients.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let tableViewSection = TableViewSection(rawValue: indexPath.section) else {
            return 0
        }
        
        switch tableViewSection {
        case .image:
            return 200.0
        case .instructions:
            return viewModel.getInstructionsCellHeight()
        case .ingredients,.glass:
            return 44.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewSection = TableViewSection(rawValue: indexPath.section) else {
            return UITableViewCell()
        }

        switch tableViewSection {
        case .instructions:
            if let instructionCell = tableView.dequeueReusableCell(withIdentifier: type(of: self).reuseTextCellIdentifier, for: indexPath) as? DrinkTextCell {
                instructionCell.text = viewModel.drink.instructions
                return instructionCell
            }
            return UITableViewCell()
            
        case .image:
            if let imageCell = tableView.dequeueReusableCell(withIdentifier: type(of: self).reuseImagesCellIdentifier, for: indexPath) as? DrinkImageCell {
                imageCell.drink = viewModel.drink
                return imageCell
            }
            return UITableViewCell()
        case .ingredients:
            if let ingredientCell = tableView.dequeueReusableCell(withIdentifier: type(of: self).reuseTextCellIdentifier, for: indexPath) as? DrinkTextCell {
                ingredientCell.attributedText = viewModel.ingredientDescriptionForIndex(idx: indexPath.row)
                return ingredientCell
            }
            return UITableViewCell()
        case .glass:
            if let glassCell = tableView.dequeueReusableCell(withIdentifier: type(of: self).reuseTextCellIdentifier, for: indexPath) as? DrinkTextCell {
                glassCell.text = viewModel.drink.glass
                return glassCell
            }
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let tableViewSection = TableViewSection(rawValue: section) else { return 0 }
        switch tableViewSection {
        case .image:
            return 0
        case .instructions, .ingredients, .glass:
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let tableViewSection = TableViewSection(rawValue: section) else { return nil }
        switch tableViewSection {
        case .image:
            return nil
        case .instructions:
            return "INSTRUCTIONS"
        case .ingredients:
            return String(format: "%d INGREDIENTS", viewModel.ingredients.count)
        case .glass:
            return "GLASS NEEDED"
        }
    }
}

extension DrinkDetailViewController: UITableViewDelegate {
    
}

