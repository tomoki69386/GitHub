//
//  ImageView.swift
//  GitHub
//
//  Created by 築山朋紀 on 2019/06/17.
//  Copyright © 2019 築山朋紀. All rights reserved.
//

import UIKit
import Nuke

@IBDesignable class ImageView: UIImageView {
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    func setImage(with urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            return
        }
        let pipeline = ImagePipeline {
            $0.dataLoader = DataLoader(configuration: {
                let configuration = DataLoader.defaultConfiguration
                configuration.urlCache = nil
                return configuration
            }())
            $0.imageCache = ImageCache()
            $0.dataCache = try! DataCache(name: "")
        }
        let request = ImageRequest(url: url)
        var options = ImageLoadingOptions()
        options.pipeline = pipeline
        loadImage(with: request, options: options, into: self)
    }
}
