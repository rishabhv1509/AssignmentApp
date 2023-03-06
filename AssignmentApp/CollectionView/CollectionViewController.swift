//
//  GridView.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation
import UIKit

class GridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, StoreVMDelegate {
    
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var viewModel: StoreViewModel = StoreViewModel.instance
    private var storeItems:[Item] = []
    private var baseItems:[Item] = []
    private var appBar = AppBarView()
    private var stackView = UIStackView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        appBar.searchBar.delegate = self
        viewModel.vmDelegate = self
        CollectionUtils(collectionView: collectionView, view: self.view, stackView: stackView, appBar: appBar).setupCollectionValues()
        CollectionUtils(collectionView: collectionView, view: self.view, stackView: stackView, appBar: appBar).setupStackView()
        CollectionViewConstraints(appBar: appBar, tableView: collectionView, view: self.view).setConstraints()
        viewModel.fetchStoreData()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCell.identifier, for: indexPath) as! GridCell
        let item = storeItems[indexPath.row]
        return CollectionUtils(collectionView: collectionView, view: self.view, stackView: stackView, appBar: appBar).setupCell(item: item, cell: cell)
        
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
    
    func search(forText: String){
        
        storeItems = storeItems.filter { item in
            item.name.lowercased().contains(forText.lowercased())
        }
        collectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.isEmpty){
            storeItems = baseItems
            collectionView.reloadData()
        }else{
            search(forText: searchText)}
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        storeItems = baseItems
        
    }
    
    func fetchDataFromVm(_ data: [Item]) {
       
    }
    
    func fetchedDataFromVm(_ vmData: DataWrapper<[Item], NetworkError>) {
        storeItems = vmData.data!
        baseItems = storeItems
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}
