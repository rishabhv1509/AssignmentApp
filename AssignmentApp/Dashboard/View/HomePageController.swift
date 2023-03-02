
//  File.swift
//  AssignmentApp
//
//  Created by Rishabh Verma on 26/02/23.


import Foundation
import UIKit

protocol PageViewControllerDelegate: AnyObject {
    func pageDidSwipe(to index: Int)
}


class HomePage: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var currentIndex: Int?
    
    var prevIndex: Int = 1
    
    // List of pages for the swipe view
    
    var pages = [UIViewController]()
    weak var swipeDelegate: PageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
//        if let firstPage = pages.first {
//            setViewControllers([firstPage], direction: .forward, animated: false, completion: nil)
//        }
        self.selectPage(at: 0)
    }
    
    func selectPage(at index: Int) {
        self.setViewControllers(
            [self.pages[index]],
            direction: self.direction(for: index),
            animated: true,
            completion: nil
        )
        self.prevIndex = index
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard pages.count > previousIndex else { return nil }
        
        return pages[previousIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < pages.count else { return nil }
        guard pages.count > nextIndex else { return nil }
        
        return pages[nextIndex]
    }
    
    private func direction(for index: Int) -> UIPageViewController.NavigationDirection {
        return index > self.prevIndex ? .forward : .reverse
    }
    
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return pages.count
//    }
    
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        guard let currentVC = pageViewController.viewControllers?.first else { return 0 }
//        return pages.firstIndex(of: currentVC) ?? 0
//    }
    
    
}


