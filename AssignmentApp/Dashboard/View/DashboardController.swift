//DAHSBOARD CONTROLLER


//
//  DashboardController.swift.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 13/02/23.
//

import UIKit
import CoreData

class DashboardViewController: UITabBarController, UITabBarControllerDelegate, PageViewControllerDelegate {
    
    
    let selectedColor = UIColor.green
    
    
    let deselectedColor = UIColor.lightGray
    
    
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
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        self.selectPage(at: viewController.view.tag)
        return false
    }
    
   
    
    func createTabs() -> HomePage? {
        let tableView = TableViewController()
        

        
        let collectionView = GridViewController()

        
     
        let tabThree = EmptyViewController()

        
        let tabFour = EmptyViewController()

        
        let tabFive = EmptyViewController()
        
        tableView.view.tag = 0
        collectionView.view.tag = 1
        tabThree.view.tag = 2
        tabFour.view.tag = 3
        tabFive.view.tag = 4
        
        let homepageController = HomePage()
        homepageController.pages = [tableView,collectionView,tabThree,tabFour,tabFive]
        homepageController.tabBarItem = tabbarItem()
        homepageController.view.tag = 1
        homepageController.swipeDelegate = self
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
    
    private func handleTabbarItemChange(viewController: UIViewController) {
        guard let viewControllers = self.viewControllers else { return }
        let selectedIndex = viewController.view.tag
        self.tabBar.tintColor = selectedColor
        self.tabBar.unselectedItemTintColor = deselectedColor
        
        for i in 0..<viewControllers.count {
            let tabbarItem = viewControllers[i].tabBarItem
            let tabbarImage = self.tabBarImage
            tabbarItem?.selectedImage = tabbarImage.withRenderingMode(.alwaysTemplate)
            tabbarItem?.image = tabbarImage.withRenderingMode(
                i == selectedIndex ? .alwaysOriginal : .alwaysTemplate
            )
        }
        
        if selectedIndex == 1 {
            viewControllers[selectedIndex].tabBarItem.selectedImage =  self.tabBarImage.withRenderingMode(.alwaysOriginal)
        }
    }
    
}
