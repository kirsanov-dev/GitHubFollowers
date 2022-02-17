//
//  UIHelper.swift
//  GitHubFollowers
//
//  Created by Oleg Kirsanov on 17.02.2022.
//

import Foundation
import UIKit

struct UIHelper {
    
    static func createThreeColumFlowLayout(for view: UIView) -> UICollectionViewFlowLayout {
        
        let width = view.bounds.width
        let padding: CGFloat = view.bounds.width / 25
        let availableWidth = width - (padding * 4)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.10)
        
        return flowLayout
    }
}
