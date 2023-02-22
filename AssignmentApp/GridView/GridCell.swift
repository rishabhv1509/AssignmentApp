//
//  GridCell.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 22/02/23.
//

import Foundation
import UIKit

class GridCell: UICollectionViewCell {
    private var thumbnailImage = UIImageView()
    private var title = UILabel()
    private var subTitle = UILabel()
    static let identifier = "GridCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(thumbnailImage)
        addSubview(title)
        addSubview(subTitle)
        _ = GridConstraints(thumbnailImage: thumbnailImage, title: title, subTitle: subTitle, view: self)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureThumbnailImage(image: String?){
        thumbnailImage.layer.cornerRadius = Constants.imageRadius
        downloadImage(from: URL(string:image!)!)
    }
    
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.thumbnailImage.image = UIImage(data: data)
            }
        }
    }
    
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func configureTitle(title:String){
        self.title.text=title
        self.title.textColor=Colors.titleColor
        self.title.adjustsFontSizeToFitWidth = true
        self.title.font=UIFont(name: Constants.interBold, size: Constants.titleSize)
    }
    
    func configuresubTitle(subTitle:String){
        self.subTitle.text=subTitle
        self.subTitle.textColor=Colors.subtitleColor
        self.subTitle.adjustsFontSizeToFitWidth = true
        self.subTitle.font=UIFont(name: Constants.interRegular, size: Constants.subTitleSize)
    }
    
}
