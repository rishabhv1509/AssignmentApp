//
//  CollectionViewConstraints.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 02/03/23.
//

import Foundation
import UIKit

struct CollectionViewConstraints{
    
    var collectionView : UICollectionView
    var view : UIView
    var appBar : AppBarView
    
    init(appBar: AppBarView, tableView: UICollectionView, view: UIView) {
        self.appBar = appBar
        self.collectionView = tableView
        
        self.view = view
        
        setConstraints()
    }
    
    func setConstraints(){
        let appBarTop = NSLayoutConstraint(item: appBar, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let appBarLeading = NSLayoutConstraint(item: appBar, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let appBarTrailing = NSLayoutConstraint(item: appBar, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -0)
        let collectionLeading = NSLayoutConstraint(item: collectionView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let collectionTrailing = NSLayoutConstraint(item: collectionView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -0)
        let appBarHeight = NSLayoutConstraint(item: appBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: appBar.appBarHeight)
        let tableBottom = NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -100)
        
        NSLayoutConstraint.activate(
            [
                collectionLeading, collectionTrailing,
                appBarTop,
                tableBottom,
                appBarLeading, appBarTrailing,
                appBarHeight
            ]
        )
    }
}
