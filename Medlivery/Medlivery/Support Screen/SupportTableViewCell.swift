//
//  SupportTableViewCell.swift
//  Medlivery
//
//  Created by Aadesh on 4/12/24.
//

import UIKit

class SupportTableViewCell: UITableViewCell {
    
    var labelSenderName: UILabel!
    var labelMessage: UILabel!
    var labelDateTime: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = Utilities.beigeColor
        
        setupLabels()
        initConstraints()
    }

    func setupLabels(){
        labelSenderName = UILabel()
        labelSenderName.font = UIFont.boldSystemFont(ofSize: 12)
        labelSenderName.numberOfLines = 1
        labelSenderName.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(labelSenderName)
        
        labelMessage = UILabel()
        labelMessage.font = UIFont.systemFont(ofSize: 14)
        labelMessage.numberOfLines = 0
        labelMessage.translatesAutoresizingMaskIntoConstraints = false
        labelMessage.clipsToBounds = true
        self.contentView.addSubview(labelMessage)
        
        labelDateTime = UILabel()
        labelDateTime.font = UIFont.systemFont(ofSize: 10)
        labelDateTime.numberOfLines = 1
        labelDateTime.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(labelDateTime)
        
        labelMessage.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)
        labelMessage.layer.cornerRadius = 3
        labelMessage.textColor = .black
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelSenderName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            labelSenderName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24),
            labelSenderName.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -24),
            
            labelMessage.topAnchor.constraint(equalTo: labelSenderName.bottomAnchor, constant: 4),
            labelMessage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24),
            labelMessage.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -24),
            
            labelDateTime.topAnchor.constraint(equalTo: labelMessage.bottomAnchor, constant: 4),
            labelDateTime.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24),
            labelDateTime.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -24),
            labelDateTime.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
        ])
    }
    
    func updateLayoutForSenderID(_ isSender: Bool) {
        if isSender {
            NSLayoutConstraint.deactivate([
                labelMessage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24)
            ])
            NSLayoutConstraint.activate([
                labelMessage.leadingAnchor.constraint(greaterThanOrEqualTo: self.contentView.leadingAnchor, constant: 24)
            ])
            NSLayoutConstraint.deactivate([
                labelSenderName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24)
            ])
            NSLayoutConstraint.activate([
                labelSenderName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24)
            ])
            NSLayoutConstraint.deactivate([
                labelDateTime.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24)
            ])
            NSLayoutConstraint.activate([
                labelDateTime.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24)
            ])
        } else {
            NSLayoutConstraint.deactivate([
               labelMessage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24)
           ])
            NSLayoutConstraint.activate([
               labelMessage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24),
           ])
            NSLayoutConstraint.deactivate([
                labelSenderName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24)
           ])
            NSLayoutConstraint.activate([
                labelSenderName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24),
           ])
            NSLayoutConstraint.deactivate([
                labelDateTime.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24)
           ])
            NSLayoutConstraint.activate([
                labelDateTime.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24),
           ])
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.labelMessage.transform = CGAffineTransform(rotationAngle: .pi)
        self.labelSenderName.transform = CGAffineTransform(rotationAngle: .pi)
        self.labelDateTime.transform = CGAffineTransform(rotationAngle: .pi)
        self.labelMessage.clipsToBounds = true
        self.labelMessage.layer.cornerRadius = 3
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
