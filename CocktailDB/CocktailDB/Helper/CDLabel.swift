//
//  MTLabel.swift
//  
//
//  Created by Khatib Mahad H. on 8/3/21.
//
import UIKit

final class CDLabel: UILabel {
    public init(size: CGFloat, isBold: Bool = false, alignment: NSTextAlignment = .left) {
        super.init(frame: .zero)
        if isBold {
            self.font = UIFont.boldSystemFont(ofSize: size)
        }
        else {
            self.font = UIFont.systemFont(ofSize: size)
        }
        self.numberOfLines = 0
        self.textAlignment = alignment
        self.lineBreakMode = .byTruncatingTail
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
