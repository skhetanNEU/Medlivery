//
//  SupportTableViewCell.swift
//  Medlivery
//
//  Created by Aadesh on 4/12/24.
//

import UIKit

class SupportTableViewCell: UITableViewCell {
    
    var labelMessage: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = Utilities.beigeColor
        
        setupLabelMessage()
        initConstraints()
    }

    func setupLabelMessage(){
        labelMessage = UILabel()
        labelMessage.font = UIFont.systemFont(ofSize: 14)
        labelMessage.numberOfLines = 0
        labelMessage.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(labelMessage)
        
        labelMessage.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)
        labelMessage.layer.cornerRadius = 7
        labelMessage.clipsToBounds = true
        labelMessage.textColor = .black
        labelMessage.textAlignment = .left
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelMessage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            labelMessage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24),
            labelMessage.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -24),
            labelMessage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
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
        } else {
            NSLayoutConstraint.deactivate([
               labelMessage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24)
           ])
            NSLayoutConstraint.activate([
               labelMessage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24),
           ])
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.labelMessage.transform = CGAffineTransform(rotationAngle: .pi)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
