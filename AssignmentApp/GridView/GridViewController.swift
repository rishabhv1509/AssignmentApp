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
        print("in here")
        super.viewDidLoad()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        storeItems = viewModel.store.response?.data
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GridCell.self, forCellWithReuseIdentifier: GridCell.identifier)
//        collectionView.contentSize = CGSize(width: 100, height: 100)
        view.addSubview(collectionView)
//        self.collectionView.frame = CGRect(x: 0, y: 180, width: self.view.frame.size.width, height: self.view.frame.size.height - 180)
        
        // Add constraints to the collection view
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
                                     collectionView.heightAnchor.constraint(equalTo: view.heightAnchor),
//                                     collectionView.topAnchor.constraint(equalTo: appBarView!.bottomAnchor,constant: -10),
//                                     collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10),
//                                     collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//                                     collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                    ])
//        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -Constants.viewLeftPadding).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
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

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (view.frame.size.width/3)-3, height: (view.frame.size.width/3)-3)
        }
}
