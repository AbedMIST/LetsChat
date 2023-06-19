//
//  RegisterViewController.swift
//  LetsChat
//
//  Created by BS1095 on 13/6/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class RegisterViewController: UIViewController {

    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Enter your Email"
        tf.autocapitalizationType = .none
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let passTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Enter your Password"
        tf.autocapitalizationType = .none
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false  //activate autolayout
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Resistration Page"
        view.backgroundColor = .systemBackground
        
        view.addSubview(emailTextField)
        view.addSubview(passTextField)
        view.addSubview(registerButton)
        
        registerButton.addTarget(self, action: #selector(regBtnPressed), for: .touchUpInside)
        
        applyConstraint()
    }
    
    
    @objc func regBtnPressed(){
        
        print(emailTextField.text, passTextField.text)
        guard let email = emailTextField.text else {return}
        guard let password = passTextField.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if let error {
                print(error.localizedDescription)
            }
            else{  //navigate to chatViewController
                print(authResult)
                let vc = ChatViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    
    private func applyConstraint(){
        
        let emailTextFieldConstraint = [
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(emailTextFieldConstraint)
        
        let passTextFieldConstraint = [
            passTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passTextField.widthAnchor.constraint(equalToConstant: 300),
            passTextField.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(passTextFieldConstraint)
        
        let registerButtonConstraint = [
            registerButton.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 30),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 120),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(registerButtonConstraint)
        
    }

}
