//
//  StartViewController.swift
//  ProjectChateo
//
//  Created by Nurlan Seitov on 26/2/24.
//

import UIKit
import SnapKit

class StartViewController: UIViewController {
    
    private lazy var chatImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        image.image = UIImage(named: "firstview")
        return image
    } ()
    
    private lazy var connectLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 24)
        title.numberOfLines = 0
        title.textAlignment = .center
        title.text = "Connect easily with your family and friends over countries"
        title.textColor = UIColor(named: "textcolor")
        return title
    } ()
    
    private lazy var termsLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 14)
        title.numberOfLines = 1
        title.textAlignment = .center
        title.text = "Terms & Privacy Policy"
        title.textColor = UIColor(named: "textcolor")
        return title
    } ()
    
    public lazy var startMessagingButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Start Messaging", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .light)
        button.tintColor = UIColor(named: "textcolorwhite")
        button.backgroundColor = UIColor(named: "buttoncolor")
        button.layer.cornerRadius = 26
        button.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
       return button
   } ()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColorView")
        let negativeSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSpacer.width = -10
        navigationItem.backBarButtonItem = negativeSpacer
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(chatImageView)
        chatImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(130)
//            make.left.equalToSuperview().inset(63)
            make.centerX.equalToSuperview()
            make.width.equalTo(260)
            make.height.equalTo(271)
        }
        
        view.addSubview(connectLabel)
        connectLabel.snp.makeConstraints { make in
            make.top.equalTo(chatImageView.snp.bottom).offset(20)
//            make.leading.trailing.equalToSuperview().inset(60)
            make.centerX.equalToSuperview()
            make.width.equalTo(278)
            make.height.equalTo(90)
        }
        
        view.addSubview(startMessagingButton)
        startMessagingButton.snp.makeConstraints { make in
//            make.top.equalTo(termsLabel.snp.bottom).offset(20)
            make.bottom.equalToSuperview().inset(50)
//            make.leading.trailing.equalToSuperview().inset(16)
//            make.leading.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
//            make.leading.trailing.equalToSuperview().inset(30)
            make.width.equalTo(328)
            make.height.equalTo(52)
        }
        
        view.addSubview(termsLabel)
        termsLabel.snp.makeConstraints { make in
//            make.top.equalTo(connectLabel.snp.bottom).offset(130)
            make.bottom.equalTo(startMessagingButton.snp.top).offset(-20)
            make.centerX.equalToSuperview()
            make.width.equalTo(148)
            make.height.equalTo(24)
        }
    }
    
    
    @objc func startTapped() {
        let nextViewController = PhoneEntryViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
//        let showLIvc = PhoneEntryViewController()
//        let nc = UINavigationController(rootViewController: showLIvc)
//        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//           let appDelegate = windowScene.delegate as? SceneDelegate {
//            appDelegate.window?.rootViewController = nc
//        }
    }

}
