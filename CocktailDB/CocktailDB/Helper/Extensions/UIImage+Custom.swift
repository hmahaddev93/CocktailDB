//
//  Image+Custom.swift
//  MusicTracks
//
//  Created by Khatib Mahad H. on 8/3/21.
//

import UIKit

extension UIImage {
    static let photoIcon = UIImage(systemName: "photo")?.withRenderingMode(.alwaysTemplate)
    static let closeIcon = UIImage(systemName: "xmark.circle")?.withRenderingMode(.alwaysTemplate)
    static let shareIcon = UIImage(named: "Share")?.withRenderingMode(.alwaysTemplate)
    static let downIcon = UIImage(systemName:"chevron.down")?.withRenderingMode(.alwaysTemplate)
}
