//
//  VerificationCodeViewController.swift
//  ProjectChateo
//
//  Created by Nurlan Seitov on 26/2/24.
//

import UIKit
import SnapKit

class VerificationCodeViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var enterLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 24)
        title.numberOfLines = 1
        title.textAlignment = .center
        title.text = "Enter Code"
        title.textColor = UIColor(named: "textcolor")
        return title
    } ()
    
    private lazy var confirmtLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 14)
        title.numberOfLines = 0
        title.textAlignment = .center
        title.text = "We have sent you an SMS with the code to +62 1309 - 1710 - 1920"
        title.textColor = UIColor(named: "textcolor")
        return title
    } ()
    
    
    private lazy var enterCodeOneTextField: UITextField = {
        let textField = UITextField()
        textField.font = .boldSystemFont(ofSize: 32)
        textField.layer.cornerRadius = 17
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.textColor = UIColor(named: "textcolor")
        textField.backgroundColor = UIColor(named: "textcolorwhite")
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.delegate = self
        return textField
    } ()
    
    private lazy var enterCodeTwoTextField: UITextField = {
        let textField = UITextField()
        textField.font = .boldSystemFont(ofSize: 32)
        textField.layer.cornerRadius = 17
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.textColor = UIColor(named: "textcolor")
        textField.backgroundColor = UIColor(named: "textcolorwhite")
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.delegate = self
        return textField
    } ()
    
    private lazy var enterCodeThreeTextField: UITextField = {
        let textField = UITextField()
        textField.font = .boldSystemFont(ofSize: 32)
        textField.layer.cornerRadius = 17
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.textColor = UIColor(named: "textcolor")
        textField.backgroundColor = UIColor(named: "textcolorwhite")
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.delegate = self
        return textField
    } ()
    
    private lazy var enterCodeFourTextField: UITextField = {
        let textField = UITextField()
        textField.font = .boldSystemFont(ofSize: 32)
        textField.layer.cornerRadius = 17
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        textField.textColor = UIColor(named: "textcolor")
        textField.backgroundColor = UIColor(named: "textcolorwhite")
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.delegate = self
        return textField
    } ()
    
    public lazy var resendCodeButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Resend Code", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .light)
        button.tintColor = UIColor(named: "textcolorblue")
        button.addTarget(self, action: #selector(resendCodeTapped), for: .touchUpInside)
       return button
   } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColorView")
        let negativeSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSpacer.width = -10
        self.navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.backBarButtonItem = negativeSpacer
        let backButton = UIBarButtonItem(title: "Your Profile", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)], for: .normal)
        setupViews()
        setupConstraints()
        enterCodeOneTextField.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, 
            let range = Range(range, in: text),
           string.count == 1 {
            let updatedText = text.replacingCharacters(in: range, with: string)
                   textField.text = updatedText
                  
                   if textField == enterCodeOneTextField {
                       enterCodeTwoTextField.becomeFirstResponder()
                   } else if textField == enterCodeTwoTextField {
                       enterCodeThreeTextField.becomeFirstResponder()
                   } else if textField == enterCodeThreeTextField {
                       enterCodeFourTextField.becomeFirstResponder()
                   } else {
                       goToNextViewController()
                   }
               }
               return false
    }
    
    func goToNextViewController() {
            let nextViewController = UserProfileViewController()
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    
    private func setupViews() {
        view.addSubview(enterLabel)
        view.addSubview(confirmtLabel)
        view.addSubview(enterCodeOneTextField)
        view.addSubview(enterCodeTwoTextField)
        view.addSubview(enterCodeThreeTextField)
        view.addSubview(enterCodeFourTextField)
        view.addSubview(resendCodeButton)
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
        
        enterCodeOneTextField.snp.makeConstraints { make in
            make.top.equalTo(confirmtLabel.snp.bottom).offset(35)
//            make.centerY.equalTo(phoneNumberTextField)
//            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(80)
//            make.trailing.equalTo(phoneNumberTextField.snp.leading).offset(8)
            make.width.equalTo(34)
            make.height.equalTo(34)
        }
        
        enterCodeTwoTextField.snp.makeConstraints { make in
            make.top.equalTo(confirmtLabel.snp.bottom).offset(35)
            make.leading.equalTo(enterCodeOneTextField.snp.trailing).offset(35)
            make.width.equalTo(34)
            make.height.equalTo(34)
        }
        
        enterCodeThreeTextField.snp.makeConstraints { make in
            make.top.equalTo(confirmtLabel.snp.bottom).offset(35)
            make.leading.equalTo(enterCodeTwoTextField.snp.trailing).offset(35)
            make.width.equalTo(34)
            make.height.equalTo(34)
        }
        
        enterCodeFourTextField.snp.makeConstraints { make in
            make.top.equalTo(confirmtLabel.snp.bottom).offset(35)
            make.leading.equalTo(enterCodeThreeTextField.snp.trailing).offset(35)
//            make.trailing.equalToSuperview().offset(-34)
//            make.centerX.equalToSuperview()
            make.width.equalTo(34)
            make.height.equalTo(34)
        }
        
        resendCodeButton.snp.makeConstraints { make in
            make.top.equalTo(enterCodeOneTextField.snp.bottom).offset(70)
            make.centerX.equalToSuperview()
            make.width.equalTo(116)
            make.height.equalTo(52)
        }
    }
    
    func showAlertResendCode() {
            let alertController = UIAlertController(title: "Resend Code", message: "Your request has been sent again. Please wait", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alertController.addAction(okAction)
            
            present(alertController, animated: true, completion: nil)
        }

    @objc func resendCodeTapped() {
        showAlertResendCode()
    }
}
