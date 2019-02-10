//
//  PatternedCollectionViewLayoutDelegae.swift
//  MarbleSolitaire
//
//  Created by Raique Pereira on 2/10/19.
//  Copyright © 2019 Raique Pereira. All rights reserved.
//

import UIKit

protocol PatternedCollectionLayoutDelegate : UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: NSIndexPath) -> CGFloat
    
    func collectionView(collectionView: UICollectionView, columnWidthForItemAtIndexPath indexPath: NSIndexPath) -> CGFloat
}

