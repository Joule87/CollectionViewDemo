//
//  GiftCardSeasonalCollectionViewCell.swift
//  WiredBrainCoffee
//
//  Created by Julio Collado on 4/19/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import UIKit

class GiftCardSeasonalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var giftCardImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        giftCardImageView.layer.cornerRadius = self.layer.cornerRadius
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
}
