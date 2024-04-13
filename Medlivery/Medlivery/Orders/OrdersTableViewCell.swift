//
//  OrdersTableViewCell.swift
//  Medlivery
//
//  Created by Abhishek Kumar on 4/5/24.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {

    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelDate: UILabel!
    var lightView: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = Utilities.beigeColor
        setupWrapperCellView()
        setupLabelName()
        setupLabelDate()
        setupLightView()
        
        initConstraints()
        
//        startBlinking()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.layer.borderColor = UIColor.gray.cgColor
        wrapperCellView.layer.borderWidth = 2.0
//        wrapperCellView.layer.cornerRadius = 130.0
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = Utilities.beigeColor
        wrapperCellView.layer.cornerRadius = 12.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 2.0
        wrapperCellView.layer.shadowOpacity = 0.7
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        labelName.font = UIFont.boldSystemFont(ofSize: 16)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupLabelDate(){
        labelDate = UILabel()
//        labelDate.font = UIFont.boldSystemFont(ofSize: 8)
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDate)
    }
    
    func setupLightView(){
        lightView = UIView()
        lightView.backgroundColor = .red // Change color as needed
        lightView.layer.cornerRadius = 5
        lightView.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(lightView)
    }
    
    
//    func setupLabelEmail(){
//        labelEmail = UILabel()
//        labelEmail.translatesAutoresizingMaskIntoConstraints = false
//        wrapperCellView.addSubview(labelEmail)
//    }
    


    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 8),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
            labelName.heightAnchor.constraint(equalToConstant: 20),
            labelName.widthAnchor.constraint(equalTo: wrapperCellView.widthAnchor, constant: -20),
            
            labelDate.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
            labelDate.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelDate.heightAnchor.constraint(equalToConstant: 16),
            labelDate.widthAnchor.constraint(lessThanOrEqualTo: labelName.widthAnchor),
            
            lightView.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            lightView.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -20),
            lightView.heightAnchor.constraint(equalToConstant: 20),
            lightView.widthAnchor.constraint(equalToConstant: 20),

            wrapperCellView.heightAnchor.constraint(equalToConstant: 60)
            
        ])
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func startBlinking() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.lightView.alpha = self.lightView.alpha == 1 ? 0 : 1
        }, completion: nil)
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        lightView.layer.removeAllAnimations()
//        print("Reusing cell")
//        startBlinking()
//    }

}
