//
//  HomeViewController.swift
//  WiredBrainCoffee
//
//  Created by Julio Collado on 4/17/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var giftCardCollectionView: UICollectionView!
    @IBOutlet weak var thankYouCollectionView: UICollectionView!
    
    @IBOutlet weak var seasonalLabel: UILabel!
    @IBOutlet weak var seasonalHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tankYouHeightConstraint: NSLayoutConstraint!
    
    var seasonalGiftCards = [GiftCardModel]() {
        didSet {
            self.giftCardCollectionView.reloadData()
        }
    }
    
    var thankYouDataSource: SmallGiftCardCollectionViewDataSource?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setHeightOfCollectionViews()
    }
    
    func setHeightOfCollectionViews() {
        let width = giftCardCollectionView.bounds.width - 35
        let height = width/1.5
        seasonalHeightConstraint.constant = height
        
        tankYouHeightConstraint.constant = height/2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GiftCardFunctions.getSeasonalGiftCards { [weak self] giftCards in
            guard let self = self else { return }
            self.seasonalGiftCards = giftCards
        }
        GiftCardFunctions.getThankYouGiftCards { [weak self] (cards) in
            guard let self = self else { return }
            self.thankYouDataSource = SmallGiftCardCollectionViewDataSource(giftCards: cards)
            self.thankYouCollectionView.delegate = self.thankYouDataSource
            self.thankYouCollectionView.dataSource = self.thankYouDataSource
            self.thankYouCollectionView.reloadData()
        }
    }
    
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seasonalGiftCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardSeasonalCollectionViewCell", for: indexPath) as! GiftCardSeasonalCollectionViewCell
        cell.giftCardImageView.image = seasonalGiftCards[indexPath.row].image
        return cell
    }
    
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 50
        let height = width/1.5
        return CGSize(width: width, height: height)
    }
    
}
