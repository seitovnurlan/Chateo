//
//  PhoneEntryViewController.swift
//  ProjectChateo
//
//  Created by Nurlan Seitov on 26/2/24.
//

import UIKit
import SnapKit

class PhoneEntryViewController: UIViewController {
    
    private var countryCodes: [String] = ["+1", "+7", "+44", "+62"]
    private var selectedCountryCode: String?
    
    private lazy var enterLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 24)
        title.numberOfLines = 1
        title.textAlignment = .center
        title.text = "Enter Your Phone Number"
        title.textColor = UIColor(named: "textcolor")
        return title
    } ()
    
    private lazy var confirmtLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 14)
        title.numberOfLines = 0
        title.textAlignment = .center
        title.text = "Please confirm your country code and enter your phone number"
        title.textColor = UIColor(named: "textcolor")
        return title
    } ()
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor(named: "textcolorwhite")
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    
    private lazy var flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "flagind")
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var countryCodeTextField: UITextField = {
        let textField = UITextField()
//        textField.placeholder = "Select Country Code"
        textField.text = "+62"
        textField.textColor = UIColor(named: "textcolorphone")
        textField.inputView = countryCodePicker
        textField.inputAccessoryView = toolbar
        textField.textAlignment = .center
//        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)

        return textField
    }()

    private lazy var countryCodePicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        return pickerView
    }()

    private lazy var toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolbar.setItems([spaceButton, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        return toolbar
    }()

    
    private lazy var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 14)
        textField.layer.cornerRadius = 4
//        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray5.cgColor
//        title.textColor = UIColor(named: "darkGrayColor")
        textField.setLeftPaddingPointsCustom(5)
        textField.placeholder = "Phone Number"
//        textField.backgroundColor = UIColor(white: 1, alpha: 1)
        textField.backgroundColor = UIColor(named: "textcolorwhite")
        textField.keyboardType = .default
//        textField.borderStyle = .roundedRect
//        title.delegate = self
        return textField
    } ()
    
    public lazy var continueButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .light)
        button.tintColor = UIColor(named: "textcolorwhite")
        button.backgroundColor = UIColor(named: "buttoncolor")
        button.layer.cornerRadius = 26
        button.layer.borderWidth = 1
//        button.backgroundColor = UIColor(white: 1, alpha: 0.3)
        button.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
       return button
   } ()
    
//    override func viewWillAppear(_ animated: Bool) {
//           super.viewWillAppear(animated)
//           self.navigationController?.navigationBar.isHidden = true
//           self.tabBarController?.tabBar.isHidden = true
//       }
              
//       override func viewWillDisappear(_ animated: Bool) {
//           super.viewWillDisappear(animated)
//           self.navigationController?.navigationBar.isHidden = false
//           self.tabBarController?.tabBar.isHidden = false
//       }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColorView")
        let negativeSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSpacer.width = -10
        self.navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.backBarButtonItem = negativeSpacer
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(enterLabel)
        view.addSubview(confirmtLabel)
        view.addSubview(backgroundImageView)
        view.addSubview(flagImageView)
        view.addSubview(countryCodeTextField)
        view.addSubview(phoneNumberTextField)
        view.addSubview(continueButton)
        }
    
    private func setupConstraints() {
        enterLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(169)
            make.centerX.equalToSuperview()
            make.width.equalTo(295)
            make.height.equalTo(30)
        }
        
        confirmtLabel.snp.makeConstraints { make in
            make.top.equalTo(enterLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(295)
            make.height.equalTo(48)
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.top.equalTo(confirmtLabel.snp.bottom).offset(30)
//            make.centerY.equalTo(phoneNumberTextField)
//            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
//            make.trailing.equalTo(phoneNumberTextField.snp.leading).offset(8)
            make.width.equalTo(84)
            make.height.equalTo(36)
        }
        
        flagImageView.snp.makeConstraints { make in
            make.top.equalTo(confirmtLabel.snp.bottom).offset(36)
//            make.centerY.equalTo(phoneNumberTextField)
//            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(44)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        countryCodeTextField.snp.makeConstraints { make in
            make.top.equalTo(confirmtLabel.snp.bottom).offset(35)
//            make.centerY.equalTo(flagImageView)
            make.leading.equalTo(flagImageView.snp.trailing).offset(8)
//            make.centerX.equalToSuperview()
//            make.leading.equalToSuperview().offset(3)
            make.width.equalTo(34)
            make.height.equalTo(24)
        }
        
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(confirmtLabel.snp.bottom).offset(30)
            make.leading.equalTo(countryCodeTextField.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-34)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(327)
            make.height.equalTo(36)
        }
        
        continueButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
//            make.leading.trailing.equalToSuperview().inset(30)
            make.width.equalTo(328)
            make.height.equalTo(52)
        }
    }

    @objc func continueTapped() {
        let nextViewController = VerificationCodeViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
//        let showLIvc = VerificationCodeViewController()
//        let nc = UINavigationController(rootViewController: showLIvc)
//        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//           let appDelegate = windowScene.delegate as? SceneDelegate {
//            appDelegate.window?.rootViewController = nc
//        }
    }
    @objc private func doneButtonTapped() {
        countryCodeTextField.resignFirstResponder()
    }
}

extension UITextField {
    func setLeftPaddingPointsCustom(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPointsCustom(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension PhoneEntryViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryCodes.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryCodes[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountryCode = countryCodes[row]
        countryCodeTextField.text = selectedCountryCode
    }
}





   
   
//    private func setupConstraints() {
//        flagImageView.snp.makeConstraints { make in
//            make.width.equalTo(24)
//            make.height.equalTo(16)
//            make.centerY.equalTo(countryCodeTextField)
//            make.leading.equalToSuperview().offset(16)
//        }
//
//        countryCodeTextField.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
//            make.leading.equalTo(flagImageView.snp.trailing).offset(8)
//            make.trailing.equalToSuperview().offset(-16)
//            make.height.equalTo(44)
//        }
//
//        phoneNumberTextField.snp.makeConstraints { make in
//            make.top.equalTo(countryCodeTextField.snp.bottom).offset(20)
//            make.leading.trailing.equalTo(countryCodeTextField)
//            make.height.equalTo(44)
//        }
//    }



