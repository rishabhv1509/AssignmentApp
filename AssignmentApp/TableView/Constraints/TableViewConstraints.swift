//
//  TableViewConstraints.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 25/02/23.
//

import Foundation
import UIKit

struct TableViewConstraints{
    var appBar, tableView, stackView, view : UIView
    var appBarHeight : CGFloat
    init(appBar: UIView, tableView: UIView, stackView: UIView, view: UIView, appBarHeight: CGFloat) {
        self.appBar = appBar
        self.tableView = tableView
        self.stackView = stackView
        self.view = view
        self.appBarHeight = appBarHeight
        setConstraints()
    }
    
    func setConstraints()  {
        appBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
//        let appBarTop = NSLayoutConstraint(item: appBar, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
//        let tableTop = NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: appBar, attribute: .bottom, multiplier: 1, constant: 20)
//        let appBarLeading = NSLayoutConstraint(item: appBar, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
//        let appBarTrailing = NSLayoutConstraint(item: appBar, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -0)
//        let tableBottom = NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 150)
//        let appBarBottom = NSLayoutConstraint(item: appBar, attribute: .bottom, relatedBy: .equal, toItem: tableView, attribute: .top, multiplier: 1, constant: 0)
//        let tableLeading = NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
//        let tableTrailing = NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -0)
//        let tableHeight = NSLayoutConstraint(item: tableView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 340)
//        let appBarHeight = NSLayoutConstraint(item: appBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: appBarHeight)
        
        print("appBarHeight")
        NSLayoutConstraint.activate(
            [
                appBar.topAnchor.constraint(equalTo: view.topAnchor),
//                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.viewLeftPadding),
//                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.viewRightPadding),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//                appBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.viewLeftPadding),
//                appBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.viewRightPadding),
                appBar.heightAnchor.constraint(equalToConstant: appBarHeight),
                appBar.widthAnchor.constraint(equalTo: view.widthAnchor),
                tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
                tableView.topAnchor.constraint(equalTo: appBar.bottomAnchor, constant: 20),
                tableView.heightAnchor.constraint(equalToConstant: 340)
//                tableLeading, tableTrailing,
             
                //                appBarBottom,
//                tableBottom,
//                appBarLeading, appBarTrailing,
//                appBarHeight
                
            ]
        )
    }
}
