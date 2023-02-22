//
//  GridCellConstraints.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 22/02/23.
//

import Foundation
import UIKit

struct GridConstraints{
    var thumbnailImage,title,subTitle,view : UIView
    
    // MARK: initializing contraints on load
    init(thumbnailImage : UIView, title : UIView, subTitle : UIView, view : UICollectionViewCell) {
        
        self.subTitle = subTitle
        self.thumbnailImage = thumbnailImage
        self.title = title
        
        self.view = view
        setConstraints()
    }
    
    func setConstraints(){
        setImageConstraints()
        setTitleConstraints()
        setSubtitleConstraints()
    }
    
    
    // MARK: set image contraints
    func setImageConstraints(){
        thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
//        thumbnailImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.viewRightPadding).isActive = true
//        thumbnailImage.heightAnchor.constraint(equalToConstant: Constants.thumbnailImageSize).isActive = true
//        thumbnailImage.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.subtitleToDividerTopPadding).isActive = true
//        thumbnailImage.widthAnchor.constraint(equalTo: thumbnailImage.heightAnchor).isActive = true
        thumbnailImage.clipsToBounds = true
    }
    
    // MARK: set title contraints
    func setTitleConstraints(){
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: thumbnailImage.leadingAnchor, constant: 5).isActive = true
        title.topAnchor.constraint(equalTo: thumbnailImage.bottomAnchor, constant: 8).isActive = true
    }
 
    
    // MARK: set subtitle contraints
    func setSubtitleConstraints(){
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.leadingAnchor.constraint(equalTo: thumbnailImage.leadingAnchor, constant: 5).isActive = true
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 5).isActive = true
    }
    
 


}
