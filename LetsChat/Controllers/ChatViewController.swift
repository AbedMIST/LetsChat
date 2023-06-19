//
//  ChatViewController.swift
//  LetsChat
//
//  Created by BS1095 on 16/6/23.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {
    
    
    private let chatTableView: UITableView = {
        let table = UITableView()
        table.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
        table.separatorStyle = .none
        return table
    }()
    
    private let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let messageTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Write a message..."
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false  //activate autolayout
        return button
    }()
    
    
    var messages: [Message] = [
        Message(sender: "ab@a.com", body: "Heyyy..."),
        Message(sender: "reza@a.com", body: "Hello"),
        Message(sender: "ab@a.com", body: "Whassup ? ")
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "👋LetsChat"
        view.backgroundColor = .systemBackground
        
        navigationItem.hidesBackButton = true
        let button = UIBarButtonItem(title: "Log Out", style: .plain , target: self, action: #selector(logoutPressed))
        navigationItem.rightBarButtonItem = button
        
        
        view.addSubview(chatTableView)
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        view.addSubview(bottomView)
        bottomView.addSubview(messageTextField)
        bottomView.addSubview(sendButton)
        
        applyConstraint()
    }
    
    
    @objc func logoutPressed(){  //sign out using firebase
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }
        catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        chatTableView.frame = view.bounds
        
        bottomView.frame = CGRect(x: 0, y: view.bounds.height - 100, width: view.bounds.width, height: 100)
    }
    
    private func applyConstraint(){
        
        let messageTextFieldConstraint = [
            messageTextField.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 20),
            messageTextField.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 25),
            messageTextField.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -35),
            messageTextField.widthAnchor.constraint(equalToConstant: 330)
        ]
        NSLayoutConstraint.activate(messageTextFieldConstraint)
        
        let sendButtonConstraint = [
            sendButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 20),
            sendButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -25),
            sendButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -35),
            sendButton.widthAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(sendButtonConstraint)
        
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.messageLabel.text = messages[indexPath.row].body
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
        
}
