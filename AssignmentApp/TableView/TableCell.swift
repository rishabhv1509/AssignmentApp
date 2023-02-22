//
//  TableCell.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 21/02/23.
//

import UIKit

class TableCell:UITableViewCell{
    static let identifier = "TableCell"
    var leadingImage = UIImageView()
    var title = UILabel()
    var subTitle = UILabel()
    var mrpSubtitle = UILabel()
    var extraSubtitle = UILabel()
    var divider = UIView()
    
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(leadingImage)
        addSubview(title)
        addSubview(subTitle)
        addSubview(extraSubtitle)
        addSubview(divider)
        addSubview(mrpSubtitle)
        configureDivider()
        _ = TableCellContraints(leadingImage: leadingImage, title: title, mrpSubtitle: mrpSubtitle, subTitle: subTitle, divider: divider, extraSubtitle: extraSubtitle, view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configureLeadingImage(image: String?){
        leadingImage.layer.cornerRadius = Constants.imageRadius
        downloadImage(from: URL(string:image!)!)
    }
    
 
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.leadingImage.image = UIImage(data: data)
            }
        }
    } 
    

    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    

    func configureTitle(title: String){
        self.title.text = title
        self.title.adjustsFontSizeToFitWidth = true
        self.title.font=UIFont(name: Constants.interBold, size: Constants.titleSize)
        self.title.textColor = Colors.titleColor
    }
    func configureMrpSubtitle(){
        self.mrpSubtitle.text = "MRP: "
        self.mrpSubtitle.adjustsFontSizeToFitWidth = true
        self.mrpSubtitle.font=UIFont(name: Constants.interRegular, size: Constants.subTitleSize)
        self.mrpSubtitle.textColor = Colors.mrpSubtitleColor
    }
    

    func configureSubtitle(subtitle: String){
        self.subTitle.text = subtitle
        self.subTitle.adjustsFontSizeToFitWidth = true
        self.subTitle.font=UIFont(name: Constants.interRegular, size: Constants.subTitleSize)
        self.subTitle.textColor = Colors.subtitleColor
    }
    

    func configureExtraSubtitle(shippingDay: String?){
        self.extraSubtitle.text = shippingDay
        self.extraSubtitle.adjustsFontSizeToFitWidth = true
        self.extraSubtitle.font=UIFont(name: Constants.interRegular, size: Constants.subTitleSize)
        self.extraSubtitle.textColor = Colors.extraSubtitleColor
        
    }
    

    func configureDivider(){
        divider.layer.borderWidth = Constants.dividerHeight
        divider.layer.borderColor = Colors.dividerColor?.cgColor
        divider.backgroundColor = Colors.dividerColor
    }
}
