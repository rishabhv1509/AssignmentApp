//
//  AppBar.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 23/02/23.
//

import Foundation
import UIKit

class AppBarController: UIViewController,UISearchBarDelegate {
    
    private var searchBar = UISearchBar()
    private var exploreLabel = UILabel()
    private var filterLabel = UILabel()
    private var _appBarHeight : CGFloat = 0
    
    var appBarHeight : CGFloat {
        get {
            return _appBarHeight
        }
        set{
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let safeArea = view.safeAreaInsets
         _appBarHeight = 160 + safeArea.top
        
        let exploreTopPadding = 55 + safeArea.top
        
        view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: appBarHeight)
        view.backgroundColor = UIColor.blue
        // Parent View
        view.backgroundColor = Colors.appBarColor

        
        // Filter Label
        filterLabel.text = CommonStrings.filter
        filterLabel.font = UIFont(name: Constants.interMedium, size: Constants.filterSize)
        filterLabel.textColor = Colors.filterColor
        
        // explore Label
        exploreLabel.text = CommonStrings.explore
        exploreLabel.textColor = Colors.exploreColor
        exploreLabel.font = UIFont(name: Constants.interBold, size: 18)
        
        // Search Bar
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 0))
        searchBar.searchTextField.backgroundColor = UIColor.clear
        searchBar.layer.cornerRadius = 25
        searchBar.barStyle = UIBarStyle.black
        searchBar.placeholder = CommonStrings.search
        searchBar.searchTextField.font = UIFont(name: Constants.interMedium, size: 16)
        searchBar.tintColor = Colors.searchColor
        searchBar.backgroundColor = UIColor.white
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        exploreLabel.translatesAutoresizingMaskIntoConstraints = false
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding views to subview
        view.addSubview(searchBar)
        view.addSubview(exploreLabel)
        view.addSubview(filterLabel)
        
        addExploreLabelConstraint(height: exploreTopPadding)
        addFilterLabelConstraint(height: exploreTopPadding)
        addSearchBarConstraint()
    }
    
    // MARK: - Constraints for Explore Label
    /// Constraints for Explore label
    private func addExploreLabelConstraint(height: CGFloat) {

        let labelTop = NSLayoutConstraint(item: exploreLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: height)
        
        let labelLeading = NSLayoutConstraint(item: exploreLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: Constants.explorePadding  )
        
        view.addConstraints([labelTop, labelLeading])
    }
    
    // MARK: - Constraints for Filter Label
    /// Constraints for Explore label
    private func addFilterLabelConstraint(height : CGFloat) {

        let filterTop = NSLayoutConstraint(item: filterLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: height)
        
        let filterTrailing = NSLayoutConstraint(item: filterLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -Constants.viewRightPadding)
        
        view.addConstraints([filterTop, filterTrailing])
    }
    
    // MARK: - Constraints for Search Bar
    /// Constraints for Explore label
    private func addSearchBarConstraint() {
        let searchBarTop = NSLayoutConstraint(item: searchBar, attribute: .top, relatedBy: .equal, toItem: exploreLabel, attribute: .bottom, multiplier: 1, constant: 15)
        
        let searchLeading = NSLayoutConstraint(item: searchBar, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: Constants.viewLeftPadding)
        
        let searchHeight = NSLayoutConstraint(item: searchBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        
        let searchTrailing = NSLayoutConstraint(item: searchBar, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -Constants.viewRightPadding)
        
        view.addConstraints([searchBarTop, searchLeading, searchHeight, searchTrailing])
    }
}
