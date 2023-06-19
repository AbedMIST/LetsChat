//
//  TableViewCell.swift
//  LetsChat
//
//  Created by BS1095 on 16/6/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    static let identifier = "MyTableViewCell"
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let myView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue // Customize the view's background color as needed
        return view
    }()
    
    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "MeAvatar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(myView)
        stackView.addArrangedSubview(myImageView)
        myView.addSubview(messageLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func applyConstraint(){
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            myView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            myView.topAnchor.constraint(equalTo: stackView.topAnchor),
            myView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            myView.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        
        NSLayoutConstraint.activate([
            myImageView.widthAnchor.constraint(equalToConstant: 50),
            myImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//    }

}
