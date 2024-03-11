//
//  SettingsViewController.swift
//  ProjectChateo
//
//  Created by Nurlan Seitov on 24/2/24.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        navigationItem.hidesBackButton = true
    }

//    override func viewDidAppear(_ animated: Bool) {
//           super.viewDidAppear(animated)
//           navigationController?.viewControllers.first?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: nil, action: nil)
//        
//       }
//    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
//        let backButton = UIBarButtonItem()
//        backButton.title = "Settings"
//        navigationItem.backBarButtonItem = backButton
//        title = "Settings"
//        navigationItem.hidesBackButton = true
//        let tabBarItem = UIBarButtonItem(title: self.title, style: .plain, target: nil, action: nil)
//           self.navigationItem.leftBarButtonItem = tabBarItem
    }

}
