//
//  SupportView.swift
//  Medlivery
//
//  Created by Aadesh on 4/12/24.
//

import UIKit

class SupportView: UIView {
    //MARK: tableView for contacts...
    var tableViewContacts: UITableView!
    
    //MARK: bottom view for adding a Contact...
    var bottomAddView:UIView!
    var textFieldMessage: UITextField!
    var buttonSend:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Utilities.beigeColor
        
        setupTableViewContacts()
        
        setupBottomAddView()
        setupTextFieldMessage()
        setupButtonSend()
        
        initConstraints()
    }
    
    //MARK: the table view to show the list of contacts...
    func setupTableViewContacts(){
        tableViewContacts = UITableView()
        tableViewContacts.backgroundColor = Utilities.beigeColor
        tableViewContacts.register(SupportTableViewCell.self, forCellReuseIdentifier: "contactCell")
        tableViewContacts.translatesAutoresizingMaskIntoConstraints = false
        tableViewContacts.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
        self.addSubview(tableViewContacts)
    }
    
    //MARK: the bottom add contact view....
    func setupBottomAddView(){
        bottomAddView = UIView()
        bottomAddView.backgroundColor = .white
        bottomAddView.layer.cornerRadius = 6
        bottomAddView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomAddView.layer.shadowOffset = .zero
        bottomAddView.layer.shadowRadius = 4.0
        bottomAddView.layer.shadowOpacity = 0.7
        bottomAddView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomAddView)
    }
    
    func setupTextFieldMessage(){
        textFieldMessage = UITextField()
        textFieldMessage.placeholder = "Type a message"
        textFieldMessage.borderStyle = .roundedRect
        textFieldMessage.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(textFieldMessage)
    }
    
    func setupButtonSend(){
        buttonSend = UIButton(type: .system)
        buttonSend.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonSend.setTitle("Send", for: .normal)
        buttonSend.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(buttonSend)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            //bottom add view...
            bottomAddView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -8),
            bottomAddView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            bottomAddView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            buttonSend.bottomAnchor.constraint(equalTo: bottomAddView.bottomAnchor, constant: -8),
            buttonSend.leadingAnchor.constraint(equalTo: bottomAddView.leadingAnchor, constant: 4),
            buttonSend.trailingAnchor.constraint(equalTo: bottomAddView.trailingAnchor, constant: -4),
            
            textFieldMessage.bottomAnchor.constraint(equalTo: buttonSend.topAnchor, constant: -8),
            textFieldMessage.leadingAnchor.constraint(equalTo: buttonSend.leadingAnchor, constant: 4),
            textFieldMessage.trailingAnchor.constraint(equalTo: buttonSend.trailingAnchor, constant: -4),
            
            bottomAddView.topAnchor.constraint(equalTo: textFieldMessage.topAnchor, constant: -8),
            //...
            
            tableViewContacts.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableViewContacts.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewContacts.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            tableViewContacts.bottomAnchor.constraint(equalTo: bottomAddView.topAnchor, constant: -8),
            
            
        ])
    }
    
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
