//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Khateeb Mahad H. on 8/12/21.
//

import UIKit

final class DrinkDetailView: UIView {

    var closeDetailViewHandler: (()->())?

    let nameLabel = CDLabel(size: 34, isBold: true)

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.tableFooterView = UIView()
        tableView.register(DrinkTextCell.self, forCellReuseIdentifier: "TextCell")
        tableView.register(DrinkImageCell.self, forCellReuseIdentifier: "DrinkImageCell")
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let topShareButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage.shareIcon, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(onShare(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let footerShareButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage.shareIcon, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("Share", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .cdBlue
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        
        let spacing: CGFloat = 10
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0)
        
        button.addTarget(self, action: #selector(onShare(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage.downIcon, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(onClose(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(closeButton)
        addSubview(topShareButton)
        addSubview(nameLabel)
        addSubview(tableView)
        addSubview(footerShareButton)
        
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 18),
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 18),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
        ])
        
        NSLayoutConstraint.activate([
            topShareButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -18),
            topShareButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 18),
            topShareButton.heightAnchor.constraint(equalToConstant: 30),
            topShareButton.widthAnchor.constraint(equalToConstant: 30),
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 18),
            nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -18),
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 49),
            nameLabel.heightAnchor.constraint(equalToConstant: 41),
        ])
        
        NSLayoutConstraint.activate([
            footerShareButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 18),
            footerShareButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -18),
            footerShareButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12),
            footerShareButton.heightAnchor.constraint(equalToConstant: 64),
        ])
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            tableView.bottomAnchor.constraint(equalTo: footerShareButton.topAnchor, constant: -12),
        ])
    
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onClose(sender: Any) {
        self.closeDetailViewHandler?()
    }
    
    @objc func onShare(sender: Any) {
    }
}
