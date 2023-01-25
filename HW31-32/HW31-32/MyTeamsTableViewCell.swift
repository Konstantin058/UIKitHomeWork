//
//  MyTeamsTableViewCell.swift
//  HW31-32
//
//  Created by Константин Евсюков on 19.08.2022.
//

import UIKit

class MyTeamsTableViewCell: UITableViewCell {

    let titleTeamLabel: UILabel = {
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
        [titleTeamLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            titleTeamLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleTeamLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            titleTeamLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8)
        ])
    }
    
    func configure(team: Teams) {
        titleTeamLabel.text = team.titleTeam
    }
}
