//
//  GridView.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation
import UIKit

class GridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var collectionView: UICollectionView!
    private var viewModel: StoreViewModel = StoreViewModel.instance
    private var storeItems:ItemsList!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.frame = view.bounds
        storeItems = viewModel.store.response?.data
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GridCell.self, forCellWithReuseIdentifier: GridCell.identifier)
        collectionView.contentSize = CGSize(width: 100, height: 100)
        view.addSubview(collectionView)
        
    }
    
    func layoutw()->UICollectionViewCompositionalLayout{
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/2),
            heightDimension: .fractionalWidth (1/2)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(2/5)),
            subitem: item,
            count: 1)
        
        let sections = NSCollectionLayoutSection(group: group)
        print("in here")
        return UICollectionViewCompositionalLayout(section: sections)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.store.response?.data.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCell.identifier, for: indexPath) as! GridCell
        let item = storeItems.items[indexPath.row]
        cell.configureTitle(title: item.name )
        cell.configuresubTitle(subTitle: item.price)
        cell.configureThumbnailImage(image: item.image)
        return cell
    }
   
    //MARK: Building the width and height of the collection view layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/3)-3, height: (view.frame.size.width/3)-3)
    }
    
    
    //MARK: Setting the inter item spacing between the cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //MARK: Setting the line spacing for the section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
}
