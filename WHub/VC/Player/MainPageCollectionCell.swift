//
//  MainPageCollectionCell.swift
//  WHub
//
//  Created by wtoe on 2019/1/14.
//  Copyright © 2019年 shihao. All rights reserved.
//

import UIKit

class MainPageCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textLabel.textColor = UIColor.black
        textLabel.font = UIFont.systemFont(ofSize: 12)
        sizeLabel.textColor = UIColor.black
        sizeLabel.font = UIFont.systemFont(ofSize: 10)
        
    }

    
}
