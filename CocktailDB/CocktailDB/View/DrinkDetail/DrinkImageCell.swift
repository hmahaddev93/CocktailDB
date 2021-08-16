//
//
//  Created by Khatib Mahad H. on 7/19/21.
//

import UIKit

final class DrinkImageCell: UITableViewCell {

    var drink: Drink? {
        didSet {
            self.categoryLabel.text = drink?.category.uppercased()
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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let categoryLabel: CDLabel = {
        let label = CDLabel(size: 10, isBold: true, alignment: .center)
        label.textColor  = .white
        label.backgroundColor = .cdGreen
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 4
        
        return label
    }()
        
    
    private func commonInit() {
        backgroundColor = .white
        self.addSubview(thumbImageView)
        self.addSubview(categoryLabel)
        
        NSLayoutConstraint.activate([
            thumbImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            thumbImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            thumbImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            thumbImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            categoryLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            categoryLabel.widthAnchor.constraint(equalToConstant: 110),
            categoryLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}
