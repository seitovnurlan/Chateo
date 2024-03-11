//
//  MainTabBarController.swift
//  ProjectChateo
//
//  Created by Nurlan Seitov on 24/2/24.
//

//import Foundation
//import UIKit

//class MainTabBarController: UITabBarController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let customButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        navigationItem.leftBarButtonItem = customButton
//        delegate = self
//        setupViewControllers()
//        
//    }
//    
//    func setupViewControllers() {
//        let contactsVc = UINavigationController(rootViewController: ContactsViewController())
//        contactsVc.viewControllers.first?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Contacts", style: .plain, target: nil, action: nil)
//
//
//        let tabItem1 = UITabBarItem(title: "",
//                                    image: UIImage(named: "contactimage"),
//                                        selectedImage: UIImage(named:"tabbarellipseblack"))
//       
//           
//        contactsVc.tabBarItem = tabItem1
//        
//        let chatsBarVc = UINavigationController(rootViewController: ChatsViewController())
//        chatsBarVc.viewControllers.first?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Chats", style: .plain, target: nil, action: nil)
//
//        let tabItem2 = UITabBarItem(title: "Chats",
//                                            image: UIImage(named: "tabbarellipseblack"),
//                                            //image: UIImage(named: "chatimage"),
//                                            selectedImage: UIImage(systemName: "tabbarellipseblack"))
//                
//        chatsBarVc.tabBarItem = tabItem2
//        
//        let settingsVc = UINavigationController(rootViewController: SettingsViewController())
//        settingsVc.viewControllers.first?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: nil, action: nil)
//
//        let tabItem3 = UITabBarItem(title: "",
//                                            image: UIImage(named: "settingimage"),
//                                            selectedImage: UIImage(systemName: "settingimage"))
//        
//        settingsVc.tabBarItem = tabItem3
//       
//        viewControllers = [contactsVc, chatsBarVc, settingsVc]
//        selectedIndex = 1
//        tabBar.backgroundColor = .systemBackground
//    }
//}
//
//extension MainTabBarController: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        let selectedIndex = tabBarController.selectedIndex
//        
//        if let navigationController = viewController as? UINavigationController {
//            let rootViewController = navigationController.viewControllers.first
//            
//            for (index, item) in tabBarController.tabBar.items!.enumerated() {
//                
//                if let rootViewController = rootViewController as? ContactsViewController, index == 0 {
//                   
//                    let customButton = (index == selectedIndex) ? UIBarButtonItem(title: "Contacts", style: .plain, target: nil, action: nil) : nil
//                    rootViewController.navigationItem.leftBarButtonItem = customButton
//                    rootViewController.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)], for: .normal)
//                                                    }
//                    
//                    
//                    if index == 0 {
//                    item.title = (index == selectedIndex) ? "Contacts" : nil
//                    item.image = (index == selectedIndex) ? UIImage(named: "tabbarellipseblack") : UIImage(named: "contactimage")
//                    
////                    }
//                
//            } else if index == 1 {
//                    item.title = (index == selectedIndex) ? "Chats" : nil
//                    item.image = (index == selectedIndex) ? UIImage(named: "tabbarellipseblack") : UIImage(named: "chatimage")
//                    //           item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
//                    //           item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 4)
//                    let customButton = (index == selectedIndex) ? UIBarButtonItem(title: "Chats", style: .plain, target: nil, action: nil) : nil
//                    rootViewController?.navigationItem.leftBarButtonItem = customButton
//                    rootViewController?.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)], for: .normal)
//                    
//                } else if index == 2 {
//                    //item.title = (index == selectedIndex) ? nil : ""
//                    item.image = (index == selectedIndex) ? UIImage(named: "settingimage") : UIImage(named: "settingimage")
//                    let customButton = (index == selectedIndex) ? UIBarButtonItem(title: "Settings", style: .plain, target: nil, action: nil) : nil
//                    rootViewController?.navigationItem.leftBarButtonItem = customButton
//                    rootViewController?.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)], for: .normal)
//                }
//            }
//        }
//    }
//}

import UIKit

class MainTabBarController: UITabBarController {
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: false)
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
               
//        rootViewController?.navigationItem.hidesBackButton = false
        
//        navigationController?.navigationBar.topItem?.leftBarButtonItem = customButton
        delegate = self
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        let contactsVC = UINavigationController(rootViewController: ContactsViewController())
        let chatsVC = UINavigationController(rootViewController: ChatsViewController())
        let settingsVC = UINavigationController(rootViewController: SettingsViewController())
        
        let tabItem1 = UITabBarItem(title: "",
                                    image: UIImage(named: "contactimage"),
                                    selectedImage: UIImage(named: "tabbarellipseblack"))
        
        let tabItem2 = UITabBarItem(title: "Chats",
                                    image: UIImage(named: "tabbarellipseblack"),
                                    selectedImage: UIImage(systemName: "tabbarellipseblack"))
        
        let tabItem3 = UITabBarItem(title: "",
                                    image: UIImage(named: "settingimage"),
                                    selectedImage: UIImage(systemName: "settingimage"))
        
        contactsVC.tabBarItem = tabItem1
        chatsVC.tabBarItem = tabItem2
        settingsVC.tabBarItem = tabItem3
        
        viewControllers = [contactsVC, chatsVC, settingsVC]
        
        selectedIndex = 1
        
        tabBar.backgroundColor = .systemBackground
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedIndex = tabBarController.selectedIndex
        
        for (index, navigationController) in viewControllers!.enumerated() where navigationController is UINavigationController {
            let rootViewController = (navigationController as! UINavigationController).viewControllers.first
            
            if let item = tabBarController.tabBar.items?[index] {
                
                switch index {
                case 0:
                    item.title = (index == selectedIndex) ? "Contacts" : nil
                    item.image = (index == selectedIndex) ? UIImage(named: "tabbarellipseblack") : UIImage(named: "contactimage")
                case 1:
                    item.title = (index == selectedIndex) ? "Chats" : nil
                    item.image = (index == selectedIndex) ? UIImage(named: "tabbarellipseblack") : UIImage(named: "chatimage")
                case 2:
                    item.title = (index == selectedIndex) ? "Settings" : nil
                    item.image = (index == selectedIndex) ? UIImage(named: "settingimage") : UIImage(named: "settingimage")
                default:
                    break
                }
                
                let customButtonTitle: String?
                switch index {
                case 0: customButtonTitle = (index == selectedIndex) ? "Contacts" : nil
                case 1: customButtonTitle = (index == selectedIndex) ? "Chats" : nil
                case 2: customButtonTitle = (index == selectedIndex) ? "Settings" : nil
                default: customButtonTitle = nil
                }
                let customButton = customButtonTitle.map { UIBarButtonItem(title: $0, style: .plain, target: nil, action: nil) }
                rootViewController?.navigationItem.leftBarButtonItem = customButton
                rootViewController?.navigationItem.leftBarButtonItem?.tintColor = UIColor.black
               
            }
        }
    }
}
