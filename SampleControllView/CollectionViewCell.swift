//
//  CollectionViewCell.swift
//  SampleControllView
//
//  Created by SeoDongHee on 2016. 4. 17..
//  Copyright © 2016년 SeoDongHee. All rights reserved.
//

import UIKit
import Photos

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    var imageManager: PHImageManager?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
        
    }
    
    var imageAsset: PHAsset? {
        didSet {
            self.imageManager?.requestImageForAsset(imageAsset!, targetSize: CGSize(width: 200, height: 200), contentMode: .AspectFill, options: nil) { image, info in
                self.imgView.image = image
            }
        }
    }
    
}
