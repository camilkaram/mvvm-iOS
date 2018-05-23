//
//  RxImageView.swift
//  Pods
//
//  Created by Arnaud Dorgans on 29/08/2017.
//
//

import UIKit
import RxCocoa
import RxSwift
import SDWebImage

extension Reactive where Base: UIImageView {
    
    public func imageURL(withPlaceholder placeholderImage: UIImage?, options: SDWebImageOptions = [], progress: SDWebImageDownloaderProgressBlock? = nil) -> Binder<URL?> {
        return Binder(self.base) { imageView, url in
            imageView.sd_setImage(with: url, placeholderImage: placeholderImage, options: options, progress: progress, completed: nil)
        }
    }
    
    public var imageURL: Binder<URL?> {
        return self.imageURL(withPlaceholder: nil)
    }
    
    public func imageWithPreviousCachedImage(withPlaceholder placeholderImage: UIImage? = nil, options: SDWebImageOptions = [], progress: SDWebImageDownloaderProgressBlock? = nil) -> Binder<URL?> {
        return Binder(self.base) { imageView, url in
            imageView.sd_setImageWithPreviousCachedImage(with: url, placeholderImage: placeholderImage, options: options, progress: progress, completed: nil)
        }
    }
    
    public var highlightedImage: Binder<URL?> {
        return self.highlightedImage()
    }
    
    public func highlightedImage(withOptions options: SDWebImageOptions = [], progress: SDWebImageDownloaderProgressBlock? = nil) -> Binder<URL?> {
        return Binder(self.base) { (imageView, url) in
            imageView.sd_setHighlightedImage(with: url, options: options, progress: progress, completed: nil)
        }
    }
    
    public var animationImages: Binder<[URL]> {
        return Binder(self.base) { (imageView, urls) in
            imageView.sd_setAnimationImages(with: urls)
        }
    }
}
