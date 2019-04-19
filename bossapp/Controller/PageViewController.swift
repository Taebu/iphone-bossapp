//
//  PageViewController.swift
//  bossapp
//
//  Created by ANP on 4/4/19.
//  Copyright © 2019 ANPR. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    lazy var orderedViewControllers: [UIViewController] = {
        return [ self.newVc(viewController: "sbGuide1"),
                 self.newVc(viewController: "sbGuide2"),
                 self.newVc(viewController: "sbGuide3"),
                 self.newVc(viewController: "sbGuide4"),
                 self.newVc(viewController: "sbGuide5")
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        if let firstViewController = orderedViewControllers.first{
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }
    
    func newVc(viewController: String) ->UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else{ return nil}
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else{
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
            
        }
        
        return orderedViewControllers[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else{ return nil}
        
        let nextIndex = viewControllerIndex + 1
        
        guard orderedViewControllers.count != nextIndex else{
            return orderedViewControllers.first
        }
        
        guard orderedViewControllers.count > nextIndex else {
            return nil
            
        }
        
        return orderedViewControllers[nextIndex]
    }
    /*
     
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}