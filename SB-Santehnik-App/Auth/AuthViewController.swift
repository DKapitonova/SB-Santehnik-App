//
//  AuthViewController.swift
//  SB-Santehnik-App
//
//  Created by Daria on 10.01.2022.
//

import UIKit

class PhoneViewController: UIViewController, UITextFieldDelegate {
    
    
    private let phoneField : UITextField = {
         let field = UITextField()
        field.backgroundColor = .secondarySystemBackground
        field.placeholder = "Phone number"
        field.returnKeyType = .continue
        field.textAlignment = .center
        return field
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(phoneField)
        phoneField.frame = CGRect(x: 0, y: 0, width: 220, height: 50)
        phoneField.center = view.center
        phoneField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let text = textField.text, !text.isEmpty {
            let number = "+7\(text)"
            AuthManager.shared.startAuth(phoneNumber: number) {
                [weak self] success in DispatchQueue.main.async {
                    let vc = SMSCodeViewController()
                    vc.title = "Enter Code"
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        return true
    }

}


class SMSCodeViewController: UIViewController, UITextFieldDelegate {
    
    
    private let codeField : UITextField = {
         let field = UITextField()
        field.backgroundColor = .secondarySystemBackground
        field.placeholder = "Enter code"
        field.returnKeyType = .continue
        field.textAlignment = .center
        return field
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(codeField)
        codeField.frame = CGRect(x: 0, y: 0, width: 220, height: 50)
        codeField.center = view.center
        codeField.delegate = self
        
    }
    
    
 func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let text = textField.text, !text.isEmpty {
            let code = text
            AuthManager.shared.verifyCode(smsCode: code) { [weak self] success in
                guard success else {return}
                DispatchQueue.main.async {
                    let vc  = ServiceViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true) 
                    
                }
            }
                
            
        }
        return true
    }

    
    
}

