//
//  GridView.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import Foundation
import UIKit

class GridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var viewModel: StoreViewModel = StoreViewModel.instance
    private var storeItems:ItemsList!
    private var baseItems:ItemsList!
    private var appBar = AppBarView()
    private var stackView = UIStackView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        appBar.translatesAutoresizingMaskIntoConstraints = false
        appBar.searchBar.delegate = self
        setupCollectionView()
        setupStackView()
        addConstraints()
        Task{
            await loadStoreData()
        }
    }
    
    func setupStackView(){
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 20
        let views = [ appBar, collectionView]
        for view in views {
            stackView.addArrangedSubview(view)
        }
        view.addSubview(stackView)
    }
    func setupCollectionView( ){
        collectionView.frame = view.bounds
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        storeItems = viewModel.store.response?.data
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GridCell.self, forCellWithReuseIdentifier: GridCell.identifier)
    }
    
    func addConstraints(){
        let appBarTop = NSLayoutConstraint(item: appBar, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let appBarLeading = NSLayoutConstraint(item: appBar, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let appBarTrailing = NSLayoutConstraint(item: appBar, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -0)
        let gridLeading = NSLayoutConstraint(item: collectionView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let gridTrailing = NSLayoutConstraint(item: collectionView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -0)
        let appBarHeight = NSLayoutConstraint(item: appBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: appBar.appBarHeight)
        let tableBottom = NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -100)

        NSLayoutConstraint.activate(
            [
                gridLeading, gridTrailing,
                appBarTop,
                tableBottom,
                appBarLeading, appBarTrailing,
                appBarHeight
            ]
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeItems.items.count
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
    
    
    func search(forText: String){
        
        storeItems.items = storeItems.items.filter { item in
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
    private var loader = LoaderView()
    
    func loadStoreData()async{
        
        loader.startLoading(view: self.view)
        await viewModel.getStoreDetails()
        storeItems = (viewModel.store.response?.data)!
        baseItems = storeItems
        loader.stopLoading(view: self.view)
        
    }
}
