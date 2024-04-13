//
//  OrdersListView.swift
//  Medlivery
//
//  Created by Abhishek Kumar on 4/5/24.
//

import UIKit

class OrdersListView: UIView {

    //MARK: tableView for contacts...
    var tableViewOrders: UITableView!
    var buttonAdd:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Utilities.beigeColor
        
        setupTableViewOrders()
        setupButtonAdd()
        
        initConstraints()
    }
    
    //MARK: the table view to show the list of contacts...
    func setupTableViewOrders(){
        tableViewOrders = UITableView()
        //tableViewOrders.sectionIndexBackgroundColor = Utilities.beigeColor
        tableViewOrders.backgroundColor = Utilities.beigeColor
//        tableViewOrders.layer.shadowColor = Utilities.beigeColor
        tableViewOrders.backgroundView = nil
        tableViewOrders.register(OrdersTableViewCell.self, forCellReuseIdentifier: "orders")
        tableViewOrders.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewOrders)
    }
    
    func setupButtonAdd(){
//        buttonAdd = UIButton(type: .system)
//        buttonAdd.titleLabel?.font = .boldSystemFont(ofSize: 16)
//        buttonAdd.setTitle("Create New Order", for: .normal)
//        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(buttonAdd)
        
        
        buttonAdd = UIButton(type: .system)
        buttonAdd.setTitle("Create New Order", for: .normal)
        buttonAdd.titleLabel?.font = .boldSystemFont(ofSize: 25)
        buttonAdd.backgroundColor = .systemTeal
        buttonAdd.layer.cornerRadius = 16 // Adjust corner radius as needed
        buttonAdd.setTitleColor(.white, for: .normal)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAdd)

    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            tableViewOrders.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewOrders.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -34),

            tableViewOrders.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewOrders.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            
            buttonAdd.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            buttonAdd.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            buttonAdd.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -19),
            
//            buttonAdd.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -1),
//            buttonAdd.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
//            buttonAdd.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
//            buttonAdd.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            
//            tableViewOrders.bottomAnchor.constraint(equalTo: buttonAdd.topAnchor, constant: -8),

        ])
    }
    
//    func restartLight(){
//        print("Restarting Light for all cells")
//        for cell in tableViewOrders.visibleCells {
//            if let blinkingCell = cell as? OrdersTableViewCell {
//                print("Starting for cell 1")
//                blinkingCell.startBlinking()
//            }
//        }
//    }
    
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
