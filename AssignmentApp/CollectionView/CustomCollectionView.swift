//
//  CustomCollectionView.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 07/03/23.
//

import UIKit

class CustomCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate { 

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private var collectionView : UICollectionView?
    
    
    private var baseItems:[Item] = []
    private var appBarView : AppBarView?
    private var stackView : UIStackView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.stackView = UIStackView()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.appBarView = AppBarView()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var storeItems: [Item] = [] {
        didSet {
            baseItems = storeItems
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }
    
    private func setupCollectionView() {
        collectionView?.dataSource = self
        collectionView?.delegate = self
        appBarView?.searchBar.delegate = self
        stackView?.addArrangedSubview(appBarView!)
        stackView?.addArrangedSubview(collectionView!)
        addSubview(stackView!)
        CollectionUtils(collectionView: collectionView!, view: self, stackView: stackView!, appBar: appBarView!).setupCollectionValues()
        CollectionUtils(collectionView: collectionView!, view: self, stackView: stackView!, appBar: appBarView!).setupStackView()
        _ = CollectionViewConstraints(appBar: appBarView!, collectionView: collectionView!, view: self)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return baseItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCell.identifier, for: indexPath) as! GridCell
        let item = baseItems[indexPath.row]
        return CollectionUtils(collectionView: collectionView, view: self, stackView: stackView!, appBar: appBarView!).setupCell(item: item, cell: cell)
        
    }
    
    //MARK: Building the width and height of the collection view layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.size.width/3)-3, height: (frame.size.width/3)-3)
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
        
        baseItems = baseItems.filter { item in
            item.name.lowercased().contains(forText.lowercased())
        }
        collectionView?.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.isEmpty){
            baseItems = storeItems
            collectionView?.reloadData()
        }else{
            search(forText: searchText)}
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        baseItems = storeItems
        
    }
}
