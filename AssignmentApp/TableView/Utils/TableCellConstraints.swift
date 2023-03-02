//
//  CellConstraints.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 22/02/23.
//

import Foundation
import UIKit

struct TableCellContraints{
    var leadingImage,title,mrpSubtitle,subTitle,divider,extraSubtitle, view : UIView
    
    // MARK: initializing contraints on load
    init(leadingImage : UIView, title : UIView, mrpSubtitle : UIView, subTitle : UIView, divider : UIView, extraSubtitle : UIView, view : UITableViewCell) {
        self.divider = divider
        self.mrpSubtitle = mrpSubtitle
        self.subTitle = subTitle
        self.leadingImage = leadingImage
        self.title = title
        self.extraSubtitle = extraSubtitle
        self.view = view
        setConstraints()
    }
    
    func setConstraints(){
        setImageConstraints()
        setTitleConstraints()
        setSubtitleConstraints()
        setMRPConstraints()
        setExtraSubtitleConstraints()
        setDividerConstraints()
    }
    
    // MARK: set extra subtitle contraints
    func setExtraSubtitleConstraints(){
        extraSubtitle.translatesAutoresizingMaskIntoConstraints = false
        extraSubtitle.bottomAnchor.constraint(equalTo: subTitle.bottomAnchor).isActive = true
        extraSubtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.viewRightPadding).isActive = true
    }
    
    // MARK: set image contraints
    func setImageConstraints(){
        leadingImage.translatesAutoresizingMaskIntoConstraints = false
        leadingImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.viewLeftPadding).isActive = true
        leadingImage.heightAnchor.constraint(equalToConstant: Constants.imageSize).isActive = true
        leadingImage.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.subtitleToDividerTopPadding).isActive = true
        leadingImage.widthAnchor.constraint(equalTo: leadingImage.heightAnchor).isActive = true
        leadingImage.clipsToBounds = true
    }
    
    // MARK: set title contraints
    func setTitleConstraints(){
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: leadingImage.trailingAnchor,constant: Constants.imageToTitlePadding).isActive = true
        title.topAnchor.constraint(equalTo: leadingImage.topAnchor).isActive = true
    }
    // MARK: set mrp contraints
    func setMRPConstraints(){
        mrpSubtitle.translatesAutoresizingMaskIntoConstraints = false
        mrpSubtitle.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        mrpSubtitle.topAnchor.constraint(equalTo: title.bottomAnchor,constant: Constants.titleToSubtilePadding).isActive = true
    }
    
    // MARK: set subtitle contraints
    func setSubtitleConstraints(){
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.leadingAnchor.constraint(equalTo: mrpSubtitle.trailingAnchor).isActive = true
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor,constant: Constants.titleToSubtilePadding).isActive = true
    }
    
    // MARK: set divider contraints
    func setDividerConstraints(){
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.leadingAnchor.constraint(equalTo: leadingImage.trailingAnchor).isActive = true
        divider.topAnchor.constraint(equalTo: subTitle.bottomAnchor,constant: Constants.subtitleToDividerBottomPadding).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 1).isActive=true
        divider.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -Constants.viewRightPadding).isActive = true
    }
}
