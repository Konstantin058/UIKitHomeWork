//
//  ConfigCell.swift
//  HW30_TableWiewNew
//
//  Created by Константин Евсюков on 11.08.2022.
//

import UIKit

class ConfigCell: UITableViewCell {

    let avatar = UIImageView()
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        [avatar, fullNameLabel, scoreLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            avatar.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            avatar.widthAnchor.constraint(equalToConstant: 32),
            avatar.heightAnchor.constraint(equalToConstant: 32),
            
            fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            fullNameLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 8),
            //fullNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            
            scoreLabel.rightAnchor.constraint(equalTo: fullNameLabel.leftAnchor, constant: 220),
            //scoreLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 8),
           // scoreLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            scoreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(contact: Student) {
        avatar.image = contact.image
        fullNameLabel.text = contact.fullName
        scoreLabel.text = String(contact.score)
    }
}
