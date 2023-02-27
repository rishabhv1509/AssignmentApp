//DAHSBOARD CONTROLLER


//
//  DashboardController.swift.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 13/02/23.
//

import UIKit

class DashboardViewController: UITabBarController, UITabBarControllerDelegate, PageViewControllerDelegate {
    
    var tabBarImage = UIImage(named: "button.png")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.view.backgroundColor = .white
        configureTabBar()
        selectPage(at: 0)
    }

    func configureTabBar(){
        
        guard let centerPageViewController = createTabs() else { return }
        
        var controllers: [UIViewController] = []
        
        controllers.append(createEmptyViewController(forIndex: 0))
        controllers.append(centerPageViewController)
        controllers.append(createEmptyViewController(forIndex: 2))
        controllers.append(createEmptyViewController(forIndex: 3))
        controllers.append(createEmptyViewController(forIndex: 4))
        
        setViewControllers(controllers, animated: false)
        
        selectedViewController = centerPageViewController
        
        self.tabBar.addTopBorder(withColor: UIColor.init(hex: "#BDC5CD")!, thickness: 0.5)
        self.tabBar.barStyle = .default
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .green
        self.tabBar.unselectedItemTintColor = .lightGray
        self.tabBar.backgroundColor = .white
        self.tabBar.isOpaque = true
        self.tabBar.insetsLayoutMarginsFromSafeArea =  true
    }
    
    func createTabs() -> HomePage? {
        let tableView = TableViewController()
        let tableTabItem = UITabBarItem( title: "", image: UIImage(named: "button.png"), selectedImage: UIImage(named: "button.png"))
        tableView.tabBarItem = tableTabItem
        
        let collectionView = GridViewController()
        let collectionTab = UITabBarItem(title: "", image: UIImage(named: "button.png"), selectedImage: UIImage(named: "button.png"))
        collectionView.tabBarItem = collectionTab
        
     
        let tabThree = EmptyViewController()
        let tabThreeItem = UITabBarItem(title: "", image: UIImage(named: "button.png"), selectedImage: UIImage(named: "button.png"))
        tabThree.tabBarItem = tabThreeItem
        
        let tabFour = EmptyViewController()
        let tabFourItem = UITabBarItem(title: "", image: UIImage(named: "button.png"), selectedImage: UIImage(named: "button.png"))
        tabFour.tabBarItem = tabFourItem
        
        let tabFive = EmptyViewController()
        let tabFiveItem = UITabBarItem(title: "", image: UIImage(named: "button.png"), selectedImage: UIImage(named: "button.png"))
        tabFive.tabBarItem = tabFiveItem
        
        let homepageController = HomePage()
        homepageController.pages = [tableView,collectionView,tabThree,tabFour,tabFive]
  
        return homepageController
        }
    
    private func createEmptyViewController(forIndex index: Int) -> UIViewController {
        let emptyViewController = UIViewController()
        emptyViewController.tabBarItem = tabbarItem()
        emptyViewController.view.tag = index
        return emptyViewController
    }
    
    func pageDidSwipe(to index: Int) {
        guard let viewController = self.viewControllers?[index] else { return }
        self.handleTabbarItemChange(viewController: viewController)
    }
    
    private func handleTabbarItemChange(viewController: UIViewController) {
        guard let viewControllers = self.viewControllers else { return }
        let selectedIndex = viewController.view.tag
        self.tabBar.tintColor = .green
        self.tabBar.unselectedItemTintColor = .gray
        
        for i in 0..<viewControllers.count {
            let tabbarItem = viewControllers[i].tabBarItem
            let tabbarImage = self.tabBar.selectedItem?.image
            
        }
        
        if selectedIndex == 1 {
            viewControllers[selectedIndex].tabBarItem.selectedImage =  self.tabBar.selectedItem?.image!.withRenderingMode(.alwaysOriginal)
        }
    }
    
    private func selectPage(at index: Int) {
        
        guard let viewController = self.viewControllers?[index] else { return }
        self.handleTabbarItemChange(viewController: viewController)
        guard let PageViewController = (self.viewControllers?[1] as? HomePage) else { return }
        PageViewController.selectPage(at: index)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(selectedIndex)")
    }
    
 
    
    private func tabbarItem() -> UITabBarItem {
        let uiTabBarItem = UITabBarItem(title: nil, image: tabBarImage, selectedImage: nil)
        uiTabBarItem.imageInsets = UIEdgeInsets(top: 14.5, left: 0, bottom: -14.5, right: 0)
        return uiTabBarItem
    }
    
}
