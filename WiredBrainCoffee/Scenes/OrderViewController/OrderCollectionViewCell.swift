//
//  OrderCollectionViewCell.swift
//  WiredBrainCoffee
//
//  Created by Julio Collado on 4/18/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import UIKit

class OrderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
}
