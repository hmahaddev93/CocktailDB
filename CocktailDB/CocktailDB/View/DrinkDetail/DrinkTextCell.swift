//
//  DrinkInstructionCell.swift
//  CocktailDB
//
//  Created by Khatib Mahad H. on 8/16/21.
//

import UIKit

final class DrinkTextCell: UITableViewCell {
    
    var attributedText: NSAttributedString? {
        didSet {
            self.instructionsLabel.attributedText = attributedText
            
            NSLayoutConstraint.activate([
                instructionsLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
                instructionsLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24),
                instructionsLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
                instructionsLabel.heightAnchor.constraint(equalToConstant: 28)
            ])
        }
    }
    
    var text: String? {
        didSet {
            guard let text = text else {
                return
            }
            self.instructionsLabel.text = text
            let height = text.heightWithConstrainedWidth(width: UIScreen.main.bounds.width - 48 , font: UIFont.systemFont(ofSize: 14))
            
            NSLayoutConstraint.activate([
                instructionsLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
                instructionsLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24),
                instructionsLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
                instructionsLabel.heightAnchor.constraint(equalToConstant: height + 14)
            ])
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let instructionsLabel: CDLabel = {
        let label = CDLabel(size: 14)
        return label
    }()
        
    
    private func commonInit() {
        backgroundColor = .white
        self.addSubview(instructionsLabel)
    }
}
