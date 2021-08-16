//
//  UIImageView+LoadURL.swift
//  
//
//  Created by Khatib Mahad H. on 8/3/21.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

// MARK: - UIImageView extension
extension UIImageView {
    
    /// This loadThumbnail function is used to download thumbnail image using urlString
    /// This method also using cache of loaded thumbnail using urlString as a key of cached thumbnail.
    func loadThumbnail(url: URL) {
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) {
            image = imageFromCache as? UIImage
            return
        }
        
        HTTPManager.shared.downloadImage(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                guard let imageToCache = UIImage(data: data) else { return }
                imageCache.setObject(imageToCache, forKey: url.absoluteString as AnyObject)
                self.image = UIImage(data: data)
            case .failure(_):
                DispatchQueue.main.async {
                    self.image = UIImage.photoIcon?.withTintColor(.lightGray)
                }
            }
        }
    }
}   
