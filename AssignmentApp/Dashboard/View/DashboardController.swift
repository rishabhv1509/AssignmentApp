//
//  DashboardController.swift.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 13/02/23.
//

import UIKit

class DashboardViewController: UITabBarController {
    private var tableView=UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        view.addSubview(HeaderViewController().view)
        createBottomNavBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 95
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        tabBar.tintColor = .green
    }

    private func createBottomNavBar() {
        let listViewController = UINavigationController(rootViewController: TableViewController())
        let gridViewController = UINavigationController(rootViewController: GridViewController())
        let emptyController1 = UINavigationController(rootViewController: EmptyViewController())
        let emptyController2 = UINavigationController(rootViewController: EmptyViewController())
        let emptyController3 = UINavigationController(rootViewController: EmptyViewController())
        
        self.setViewControllers([listViewController, gridViewController, emptyController1, emptyController2, emptyController3], animated: true)
        
        guard let items = self.tabBar.items else {
            return
        }
        
        for i in 0..<items.count {
            items[i].image = UIImage(named: "button.png")
        }
        
        self.modalPresentationStyle = .fullScreen
    }
}
