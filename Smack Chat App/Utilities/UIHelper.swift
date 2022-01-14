//
//  UIHelper.swift
//  Smack Chat App
//
//  Created by Ferry Adi Wijayanto on 14/01/22.
//

import Foundation

enum UIHelper {
    
    static func createCollectionViewFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                           = view.bounds.width
        let padding: CGFloat                = 12
        let minimumInterimSpacing: CGFloat  = 10
        let availableWidth                  = width - (padding * 2) - (minimumInterimSpacing * 2)
        
        let itemWidth: CGFloat              = availableWidth / 3
        
        let flowLayout                      = UICollectionViewFlowLayout()
        flowLayout.sectionInset             = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize                 = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    static func createCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let screenWidth                     = UIScreen.main.bounds.width
        let padding: CGFloat                = 12
        let minimumInterimSpacing: CGFloat  = 10
        let availableWidth                  = screenWidth - (padding * 2) - (minimumInterimSpacing * 2)
        var numberOfColumn: CGFloat
        
        // 375 is iPhone SE width
        if screenWidth > 375 {
            numberOfColumn = 4
        } else {
            numberOfColumn = 3
        }
        
        let itemWidth                       = availableWidth / numberOfColumn
        print(numberOfColumn)
        
        let flowLayout                      = UICollectionViewFlowLayout()
        flowLayout.sectionInset             = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize                 = CGSize(width: itemWidth, height: itemWidth)
        
        return flowLayout
    }
}
