//
//  MainTabBarController.swift
//  ProjectChateo
//
//  Created by Nurlan Seitov on 24/2/24.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupViewControllers()
    }
    
    func setupViewControllers() {
        let contactsVc = UINavigationController(rootViewController: ContactsViewController())
        let tabItem1 = UITabBarItem(title: "",
                                    image: UIImage(named: "contactimage"),
                                        selectedImage: UIImage(named:"tabbarellipseblack"))
        
        contactsVc.tabBarItem = tabItem1
        
        let chatsBarVc = UINavigationController(rootViewController: ChatsViewController())
        let tabItem2 = UITabBarItem(title: "Chats",
                                            image: UIImage(named: "tabbarellipseblack"),
                                            //image: UIImage(named: "chatimage"),
                                            selectedImage: UIImage(systemName: "tabbarellipseblack"))
                
        chatsBarVc.tabBarItem = tabItem2
        
        let settingsVc = UINavigationController(rootViewController: SettingsViewController())
        let tabItem3 = UITabBarItem(title: "",
                                            image: UIImage(named: "settingimage"),
                                            selectedImage: UIImage(systemName: "settingimage"))
        
        settingsVc.tabBarItem = tabItem3
        
       
        viewControllers = [contactsVc, chatsBarVc, settingsVc]
        selectedIndex = 1
        tabBar.backgroundColor = .systemBackground
//        tabBar.backgroundColor = .white
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedIndex = tabBarController.selectedIndex
        
        for (index, item) in tabBarController.tabBar.items!.enumerated() {
            
            if index == 0 {
           item.title = (index == selectedIndex) ? "Contacts" : nil
           item.image = (index == selectedIndex) ? UIImage(named: "tabbarellipseblack") : UIImage(named: "contactimage")
       } else if index == 1 {
           item.title = (index == selectedIndex) ? "\nChats" : nil
           item.image = (index == selectedIndex) ? UIImage(named: "tabbarellipseblack") : UIImage(named: "chatimage")
//           item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
//           item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 4)
       } else if index == 2 {
           //item.title = (index == selectedIndex) ? nil : ""
           item.image = (index == selectedIndex) ? UIImage(named: "settingimage") : UIImage(named: "settingimage")
            }
        }
    }
}

//extension MainTabBarController: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        let selectedIndex = tabBarController.selectedIndex
//        
//        for (index, item) in tabBarController.tabBar.items!.enumerated() {
//            if index == 0 {
//                item.title = (index == selectedIndex) ? "Contacts" : nil
//            } else if index == 1 {
//                item.title = (index == selectedIndex) ? "Chats" : nil
//            } else if index == 2 {
//                item.title = ""
//            }
//        }
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        // Установка пользовательских изображений для фона и иконок вкладок
//        let tabBar = self.tabBar
//        tabBar.selectionIndicatorImage = UIImage() // Убираем выделение
//        tabBar.backgroundImage = UIImage(named: "custom_tab_bar_background") // Устанавливаем изображение с прозрачным фоном и пустым пространством для текста
//        tabBar.items?[0].image = UIImage(named: "contactimage") // Устанавливаем изображение для вкладки Contacts
//        tabBar.items?[1].image = UIImage(named: "chatimage") // Устанавливаем изображение для вкладки Chats
//        tabBar.items?[2].image = UIImage(named: "settingimage") // Устанавливаем изображение для вкладки Settings
//    }
//}
