//
//  TableUtils.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 02/03/23.
//

import Foundation
import UIKit


/// Utilities to setup table view
struct TableUtils {
//    static let instance = TableUtils(view: UIView())
    
    var view : UIView
    
     var tableView : UITableView!
      var stackView : UIStackView!
     var appBar : AppBarView!
    
    
        init(tableView: UITableView, view: UIView, stackView: UIStackView, appBar: AppBarView) {
            self.tableView = tableView
            self.view = view
            self.stackView = stackView
            self.appBar = appBar
            
        }
    
    
    /// setup table values
    func setTableValues()  {
        tableView.register(TableCell.self, forCellReuseIdentifier: TableCell.identifier)
        tableView.showsVerticalScrollIndicator = true
        tableView.rowHeight = Constants.tableRowHeight
        tableView.frame = .zero
        tableView.contentInset = UIEdgeInsets(top: Constants.tableTopPadding, left: 0, bottom: 0, right: 0)
    }
    
    
    /// setup stack view
    func setupStackView(){
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 0
        appBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let views = [ appBar, tableView]
        for view in views {
            stackView.addArrangedSubview(view!)
        }
        view.addSubview(stackView)
    }
    
    func setupCell(item : Item, cell : TableCell) -> UITableViewCell {
        cell.configureLeadingImage(image: item.image)
        cell.configureTitle(title: item.name )
        cell.configureSubtitle(subtitle: item.price )
        cell.configureExtraSubtitle(shippingDay: item.extra)
        cell.configureMrpSubtitle()
        cell.selectionStyle = .none
        return cell
    }
}
