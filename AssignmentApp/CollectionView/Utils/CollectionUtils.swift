//
//  CollectionUtils.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 02/03/23.
//

import Foundation
import UIKit


/// Utilities to setup table view
struct CollectionUtils {
    //    static let instance = TableUtils(view: UIView())
    
    var view : UIView
    
    var collectionView : UICollectionView!
    var stackView : UIStackView!
    var appBar : AppBarView!
    
    
    init(collectionView: UICollectionView, view: UIView, stackView: UIStackView, appBar: AppBarView) {
        self.collectionView = collectionView
        self.view = view
        self.stackView = stackView
        self.appBar = appBar
        
    }
    
    
    /// setup collection values
    func setupCollectionValues( ){
        collectionView.frame = view.bounds
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(GridCell.self, forCellWithReuseIdentifier: GridCell.identifier)
    }
    
    
    /// setup stack view
    func setupStackView(){
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 20
        let views = [ appBar, collectionView]
        for view in views {
            stackView.addArrangedSubview(view!)
        }
        view.addSubview(stackView)
    }
    
    
    /// Setup Cell
    /// - Parameters:
    ///   - item: item which is converted into cell
    ///   - cell: cell type to be converted in
    /// - Returns: return a cell from the item
    func setupCell(item : Item, cell : GridCell) -> UICollectionViewCell {
        cell.configureTitle(title: item.name )
        cell.configuresubTitle(subTitle: item.price)
        cell.configureThumbnailImage(image: item.image)
        return cell
    }
}
