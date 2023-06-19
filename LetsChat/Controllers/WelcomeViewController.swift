//
//  ViewController.swift
//  LetsChat
//
//  Created by BS1095 on 13/6/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 33, weight: .bold)
        label.text = ""
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register here", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false  //activate autolayout
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login here", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false  //activate autolayout
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Welcome"
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.blue,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold)
        ]
        let privacyButton = UIBarButtonItem(image: UIImage(systemName: "shield.righthalf.filled"), style: .plain, target: self, action: #selector(privacyButtonTapped))
        navigationItem.rightBarButtonItem = privacyButton

        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(registerButton)
        view.addSubview(loginButton)
        
        
//        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        var idx = 0.0
        let text = "👋LetsChat"
        for letter in text{
//            print(0.2*idx, letter)
            Timer.scheduledTimer(withTimeInterval: 0.2*idx, repeats: false) { timer in
                self.titleLabel.text?.append(letter)   //9 different timer is created
            }
            idx += 1
        }
        
        registerButton.addTarget(self, action: #selector(regBtnPressed), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
        
        
        applyConstraint()
    }
    
    @objc func regBtnPressed(){
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)//need to embed current VC as navVC
    }
    
    @objc func loginBtnPressed(){ 
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func privacyButtonTapped(){
        let vc = UINavigationController(rootViewController: PrivacyViewController())
        present(vc, animated: true)                                //Modal presentation
    }
    
    
    
    private func applyConstraint(){
        
        let titleLabelConstraint = [
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(titleLabelConstraint)
        
        let loginButtonConstraint = [
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 280),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(loginButtonConstraint)
        
        let registerButtonConstraint = [
            registerButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -20),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 280),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(registerButtonConstraint)
    }

}

