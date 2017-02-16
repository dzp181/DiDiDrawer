//
//  CollectionViewCell.swift
//  Bad
//
//  Created by dengzhiping on 2017/2/15.
//  Copyright © 2017年 DongHui. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var iconImage: UIImageView!
    
}

extension CollectionViewCell {
    class func cell() -> CollectionViewCell {
        return Bundle.main.loadNibNamed("CollectionCell", owner: self, options: nil)?.first as! CollectionViewCell
    }
    
}
