//
//  CrossCollectionViewLayout.swift
//
//  Created by Ricky Pereira on 10/12/18.
//  Copyright © 2018 Ricky Pereira. All rights reserved.
//

import UIKit

class CrossCollectionViewLayout: UICollectionViewLayout {
    
    private var delegate: PatternedCollectionLayoutDelegate?
    private var offsetValue : CGFloat = 25

    
    private var cache = [UICollectionViewLayoutAttributes]()
    private var contentHeight: CGFloat = 0
    private var width: CGFloat {
        get {
            return collectionView!.bounds.width
        }
    }
    override var collectionViewContentSize : CGSize {
        return CGSize(width: width, height: contentHeight)
    }
    
    
    public func setDataSource(dataSource : UICollectionViewDataSource) {
        
        
    }
    
    
    override func prepare() {
        collectionView!.contentInset = UIEdgeInsets(top: collectionView!.center.y / 2,
                                                    left: collectionView!.center.x / 8,
                                                    bottom: collectionView!.center.y / 2,
                                                    right: collectionView!.center.x / 8)
        
        if cache.isEmpty {
            PatternedCollectionLayoutDelegate.
            var yOffsets = [CGFloat](repeating: offsetValue, count : numberOfColumns)
            var column = 0

            for section in 0..<collectionView!.numberOfSections {
                var row = getStartingX(section: section)
                for item in 0..<collectionView!.numberOfItems(inSection: section){
                    let indexPath = IndexPath(item: item, section: section)
                    let nsIndexPath = NSIndexPath(item: item, section: section)
                    let columnWidth = delegate!.collectionView(collectionView: collectionView!, columnWidthForItemAtIndexPath: nsIndexPath)
                    let height = delegate!.collectionView(collectionView: collectionView!,heightForItemAtIndexPath: nsIndexPath)
                    
                    let frame = CGRect(x: row, y: yOffsets[column],
                                       width: columnWidth, height: height)
                    let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                    attributes.frame = frame
                    cache.append(attributes)
                    contentHeight = max(contentHeight, frame.maxY)
                    row = row + offsetValue
                    
                    column = column >=  (collectionView!
                        .numberOfItems(inSection: section) - 1) ? 0 : (column + 1)
                }
                let currentOffset = yOffsets[0] + offsetValue
                yOffsets = [CGFloat](repeating: currentOffset, count: numberOfColumns)
                
            }
        }
    }
    
    private func getStartingX(section: Int) -> CGFloat{
        if (section <= 1 || section >= 5) {
            return 100
        } else {
            return 0
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
            
        }
        
        return layoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {        
        return super.layoutAttributesForItem(at: indexPath)
    }


}


