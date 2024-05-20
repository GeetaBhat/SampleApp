//
//  ViewController.swift
//  SampleApp
//
//  Created by Geeta Bhat on 15/05/24.
//

import UIKit
#if PRO
import SampleModule
#endif
class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let firstController = FirstViewController()
        let secondController = SecondViewController()
        
        firstController.title = "First"
        secondController.title = "Second"
        self.setViewControllers([firstController, secondController], animated: true)
        self.tabBar.tintColor = .black
        
        let images = ["house", "star"]
        guard let items = self.tabBar.items else {return }
        
        for i in 0...1 {
            items[i].image = UIImage(systemName: images[i])

        }
        
        #if PRO
            let proController = ProController()
            proController.title = "Pro"
            items[1].image = UIImage(systemName: images[1])
            self.setViewControllers([firstController, proController], animated: true)
            self.selectedIndex = 1
        #endif
    }
}

