//
//  GenericCollectionViewDelegate.swift
//  MarbleSolitaire
//
//  Created by Raique Pereira on 2/10/19.
//  Copyright © 2019 Raique Pereira. All rights reserved.
//

import UIKit

class GenericCollectionViewLayoutDelegate: PatternedCollectionLayoutDelegate {
    private var height: CGFloat
    private var columnWidth : CGFloat
    
    
    init() {
        self.height = CGFloat(50)
        self.columnWidth = CGFloat(50)
    }
    
    init(height: CGFloat, columnWidth : CGFloat) {
        self.height = height
        self.columnWidth = columnWidth
    }
    
    
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return height
    }
    
    func collectionView(collectionView: UICollectionView, columnWidthForItemAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return columnWidth
    }
    

}
