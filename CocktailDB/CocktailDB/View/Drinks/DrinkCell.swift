//
//
//  Created by Khatib Mahad H. on 7/19/21.
//

import UIKit

final class DrinkCell: UITableViewCell {

    var drink: Drink? {
        didSet {
            self.nameLabel.text = drink?.name
            self.categoryLabel.text = drink?.category
            self.instructionsLabel.text = drink?.instructions
            
            guard let thumbnailUrl = drink?.thumbnailURL else {
                return
            }
            self.thumbImageView.loadThumbnail(url: thumbnailUrl)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let thumbImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let nameLabel = CDLabel(size: 16, isBold: true)
    let categoryLabel = CDLabel(size: 11, isBold: true)
    let instructionsLabel: CDLabel = {
        let label = CDLabel(size: 14)
        label.numberOfLines = 2
        return label
    }()
    
    
    private func commonInit() {
        backgroundColor = .white
        self.addSubview(thumbImageView)
        self.addSubview(nameLabel)
        self.addSubview(categoryLabel)
        self.addSubview(instructionsLabel)

        
        NSLayoutConstraint.activate([
            thumbImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            thumbImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            thumbImageView.widthAnchor.constraint(equalToConstant: 60),
            thumbImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: thumbImageView.trailingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            nameLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 0),
            categoryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            categoryLabel.heightAnchor.constraint(equalToConstant: 23)
        ])
        
        NSLayoutConstraint.activate([
            instructionsLabel.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor),
            instructionsLabel.trailingAnchor.constraint(equalTo: categoryLabel.trailingAnchor, constant: 0),
            instructionsLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 0),
            instructionsLabel.heightAnchor.constraint(equalToConstant: 41)
        ])
    }
}
