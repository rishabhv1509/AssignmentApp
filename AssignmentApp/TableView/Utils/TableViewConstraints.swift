//
//  TableViewConstraints.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 25/02/23.
//

import Foundation
import UIKit


///  Utility to set table view constraints
struct TableViewConstraints{
    var tableView, view : UIView
    var appBar : AppBarView
    
    init(appBar: AppBarView, tableView: UIView, view: UIView) {
        self.appBar = appBar
        self.tableView = tableView
        
        self.view = view
        
        setConstraints()
    }
    
    
    /// set table view constraints
    func setConstraints()  {
        appBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let appBarTop = NSLayoutConstraint(item: appBar, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let appBarLeading = NSLayoutConstraint(item: appBar, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let appBarTrailing = NSLayoutConstraint(item: appBar, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -0)
        let tableLeading = NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let tableTrailing = NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -0)
        let appBarHeight = NSLayoutConstraint(item: appBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: appBar.appBarHeight)
        let tableBottom = NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -100)
        
        NSLayoutConstraint.activate(
            [
                tableLeading, tableTrailing,
                appBarTop,
                tableBottom,
                appBarLeading, appBarTrailing,
                appBarHeight,
            ]
        )
    }
}
