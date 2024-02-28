//
//  UserProfileViewController.swift
//  ProjectChateo
//
//  Created by Nurlan Seitov on 28/2/24.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    
    private lazy var backgroundProfImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor(named: "textcolorwhite")
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor(named: "textcolorwhite")
        imageView.image = UIImage(named: "changeimage")
        imageView.tintColor = UIColor(named: "textcolor")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    public lazy var addfotoButton: UIButton = {
       let button = UIButton(type: .system)
        button.setImage(UIImage(named: "changeicon"), for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .light)
        button.tintColor = UIColor(named: "textcolor")
//        button.backgroundColor = UIColor(named: "textcolor")
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 12
//        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(addfotoTapped), for: .touchUpInside)
       return button
   } ()
    
    private lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.layer.cornerRadius = 4
        textField.textColor = UIColor(named: "textcolor")
        textField.setLeftPaddingPointsCustom(8)
        textField.placeholder = "First Name (Required)"
        textField.textAlignment = .left
//        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(named: "textcolorwhite")
        
        return textField
    }()

   
    private lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 14)
        textField.layer.cornerRadius = 4
//        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.textColor = UIColor(named: "textcolor")
        textField.setLeftPaddingPointsCustom(8)
        textField.placeholder = "Last Name (Optional)"
//        textField.backgroundColor = UIColor(white: 1, alpha: 1)
        textField.backgroundColor = UIColor(named: "textcolorwhite")
        textField.keyboardType = .default
//        textField.borderStyle = .roundedRect
//        title.delegate = self
        return textField
    } ()
    
    public lazy var saveButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .light)
        button.tintColor = UIColor(named: "textcolorwhite")
        button.backgroundColor = UIColor(named: "buttoncolor")
        button.layer.cornerRadius = 26
        button.layer.borderWidth = 1
//        button.backgroundColor = UIColor(white: 1, alpha: 0.3)
        button.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
       return button
   } ()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColorView")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

//        let negativeSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
//        negativeSpacer.width = -10
//        navigationItem.backBarButtonItem = negativeSpacer
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(backgroundProfImageView)
        view.addSubview(profileImageView)
        view.addSubview(addfotoButton)
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(saveButton)
        }
    
    private func setupConstraints() {
        backgroundProfImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(136)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(101)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(156)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(56)
        }
        
        addfotoButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(5)
            make.leading.equalTo(profileImageView.snp.trailing).offset(5)
            make.width.height.equalTo(24)
        }
        
        firstNameTextField.snp.makeConstraints { make in
            make.top.equalTo(backgroundProfImageView.snp.bottom).offset(36)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(36)
        }
        
        lastNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstNameTextField.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(36)
        }
        
        saveButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
//            make.leading.trailing.equalToSuperview().offset(30)
            make.width.equalTo(328)
            make.height.equalTo(52)
        }
    }
    
    func showAlertProf() {
            let alertController = UIAlertController(title: "Your Profile", message: "Add foto please", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alertController.addAction(okAction)
            
            present(alertController, animated: true, completion: nil)
        }
    
    @objc func addfotoTapped() {
        showAlertProf()
    }
    
    @objc func saveTapped() {
//        let nextViewController = MainTabBarController()
//        navigationController?.pushViewController(nextViewController, animated: true)
        let showLIvc = MainTabBarController()
        let nc = UINavigationController(rootViewController: showLIvc)
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let appDelegate = windowScene.delegate as? SceneDelegate {
            appDelegate.window?.rootViewController = nc
        }
    }

}
