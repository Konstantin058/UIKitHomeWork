//
//  UsersViewController.swift
//  addDayOfBirthForUser
//
//  Created by Константин Евсюков on 09.07.2022.
//

import Foundation
import UIKit

class UsersViewController: UIViewController {
    
    private let backView = UIView()
    private let imageView = UIImageView()
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    let ageLabel = UILabel()
    let sexLabel = UILabel()
    let instagramLabel = UILabel()
    
    
    private var user: User? = nil {
        didSet{
            nameLabel.text = user?.name
            ageLabel.text = user?.age
            imageView.image = UIImage(systemName: "person.circle.fill")
        }
    }
    
    private(set) var addUser: (User) -> () = { _ in }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Пользователи"
        
        configureNavigationBar()
        configureSubviews()
        createLabel()
        addSubViews()
        makeConstraints()
        
        addUser = { [weak self] user in
            self?.user = user
        }
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.backButtonTitle = "Назад"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapAddButton))
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
    }
    
    func configureSubviews() {
        backView.backgroundColor = .black.withAlphaComponent(0.1)
        backView.layer.cornerRadius = 5

        imageView.image = UIImage(systemName: "questionmark.circle")
        imageView.tintColor = .white
    }
    
    func createLabel() {
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textColor = .black
        nameLabel.text = "Пока нет пользователей"
        
        ageLabel.font = .systemFont(ofSize: 13)
        ageLabel.textColor = .black.withAlphaComponent(0.8)
    }
    
    @objc func tapAddButton() {
        let informOfUserVC = InformationOfUserViewController(addUser: addUser)
        navigationController?.pushViewController(informOfUserVC, animated: true)
    }
    
}


//MARK: Extension
extension UsersViewController {
    
    private func addSubViews() {
        [backView, imageView, nameLabel, ageLabel, dateLabel, sexLabel, instagramLabel].forEach { view.addSubview($0) }
    }
    
    private func makeConstraints() {
        [backView, imageView, nameLabel, ageLabel, dateLabel, sexLabel, instagramLabel].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            backView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            backView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            backView.heightAnchor.constraint(equalToConstant: 60),
            
            imageView.heightAnchor.constraint(equalToConstant: 50),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            nameLabel.heightAnchor.constraint(equalToConstant: 25),
            nameLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            
            ageLabel.heightAnchor.constraint(equalToConstant: 15),
            ageLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 10),
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            ageLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
        ])
    
    }
}
