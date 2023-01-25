//
//  ViewController.swift
//  HW_27-28_TextField_Swift
//
//  Created by Константин Евсюков on 13.07.2022.
//

/*
 Создайте поля (и лейблы напротив как в уроке): имя, фамилия, логин, пароль, возраст, телефон, имеил адрес.
 */

import UIKit

class ViewController: UIViewController {
    
    private let firstNameLabel = UILabel()
    private let lastNameLabel = UILabel()
    private let loginLabel = UILabel()
    private let passwordLbel = UILabel()
    private let ageLabel = UILabel()
    private let phoneLabel = UILabel()
    private let emailLabel = UILabel()
    
    private let firstNameTextField = UITextField()
    private let lastNameTextField = UITextField()
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    private let ageTextField = UITextField()
    private let phoneTextField = UITextField()
    private let emailTextField = UITextField()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignBackground()
        createLabeles() 
        createTextField()
        addSubViews()
        makeConstraints()
    }
    
    func assignBackground() {
        let background = UIImage(named: "fon")
        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func createLabeles() {
        firstNameLabel.text = "Имя"
        firstNameLabel.textColor = .red
        firstNameLabel.font = .boldSystemFont(ofSize: 22)
        
        lastNameLabel.text = "Фамилия"
        lastNameLabel.textColor = .red
        lastNameLabel.font = .boldSystemFont(ofSize: 22)
        
        loginLabel.text = "Логин"
        loginLabel.textColor = .red
        loginLabel.font = .boldSystemFont(ofSize: 22)
        
        passwordLbel.text = "Пароль"
        passwordLbel.textColor = .red
        passwordLbel.font = .boldSystemFont(ofSize: 22)
        
        ageLabel.text = "Возраст"
        ageLabel.textColor = .red
        ageLabel.font = .boldSystemFont(ofSize: 22)
        
        phoneLabel.text = "Телефон"
        phoneLabel.textColor = .red
        phoneLabel.font = .boldSystemFont(ofSize: 22)
        
        emailLabel.text = "Email"
        emailLabel.textColor = .red
        emailLabel.font = .boldSystemFont(ofSize: 22)
    }
    
    func createTextField() {
        firstNameTextField.placeholder = "Ваше имя"
        firstNameTextField.borderStyle = .roundedRect
        firstNameTextField.font = .boldSystemFont(ofSize: 18)
        firstNameTextField.textColor = .black
        firstNameTextField.keyboardType = .alphabet
        firstNameTextField.clearButtonMode = .whileEditing
        //firstNameTextField.autocorrectionType = .yes
        firstNameTextField.returnKeyType = .next
        firstNameTextField.delegate = self
        
        lastNameTextField.placeholder = "Фамилия"
        lastNameTextField.borderStyle = .roundedRect
        lastNameTextField.font = .boldSystemFont(ofSize: 18)
        lastNameTextField.textColor = .black
        lastNameTextField.keyboardType = .alphabet
        lastNameTextField.clearButtonMode = .whileEditing
        //firstNameTextField.autocorrectionType = .yes
        lastNameTextField.returnKeyType = .next
        lastNameTextField.delegate = self
        
        loginTextField.placeholder = "Логин"
        loginTextField.borderStyle = .roundedRect
        loginTextField.font = .boldSystemFont(ofSize: 18)
        loginTextField.textColor = .black
        loginTextField.keyboardType = .emailAddress
        loginTextField.clearButtonMode = .whileEditing
        //firstNameTextField.autocorrectionType = .yes
        loginTextField.returnKeyType = .next
        loginTextField.delegate = self
        
        passwordTextField.placeholder = "Пароль"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.font = .boldSystemFont(ofSize: 18)
        passwordTextField.textColor = .black
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardType = .alphabet
        passwordTextField.clearButtonMode = .whileEditing
        //firstNameTextField.autocorrectionType = .yes
        passwordTextField.returnKeyType = .next
        passwordTextField.delegate = self
        
        ageTextField.placeholder = "Возраст"
        ageTextField.borderStyle = .roundedRect
        ageTextField.font = .boldSystemFont(ofSize: 18)
        ageTextField.textColor = .black
        ageTextField.keyboardType = .numbersAndPunctuation
        ageTextField.clearButtonMode = .whileEditing
        //firstNameTextField.autocorrectionType = .yes
        ageTextField.returnKeyType = .next
        ageTextField.delegate = self
        
        phoneTextField.placeholder = "+x(xxx)xxx-xx-xx"
        phoneTextField.borderStyle = .roundedRect
        phoneTextField.font = .boldSystemFont(ofSize: 18)
        phoneTextField.textColor = .black
        phoneTextField.keyboardType = .numberPad
        phoneTextField.clearButtonMode = .whileEditing
        //firstNameTextField.autocorrectionType = .yes
        phoneTextField.returnKeyType = .next
        phoneTextField.delegate = self
        
        emailTextField.placeholder = "Почта"
        emailTextField.borderStyle = .roundedRect
        emailTextField.font = .boldSystemFont(ofSize: 18)
        emailTextField.textColor = .black
        emailTextField.keyboardType = .emailAddress
        emailTextField.clearButtonMode = .whileEditing
        //firstNameTextField.autocorrectionType = .yes
        emailTextField.returnKeyType = .done
    }
}


extension ViewController: UITextFieldDelegate {
    
    private func addSubViews() {
        [firstNameLabel, loginLabel, lastNameLabel, ageLabel, passwordLbel, phoneLabel, emailLabel, firstNameTextField, lastNameTextField, loginTextField, ageTextField, passwordTextField, phoneTextField, emailTextField].forEach { view.addSubview($0) }
    }
    
    private func makeConstraints() {
        [firstNameLabel, loginLabel, lastNameLabel, ageLabel, passwordLbel, phoneLabel, emailLabel, firstNameTextField, lastNameTextField, loginTextField, ageTextField, passwordTextField, phoneTextField, emailTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            firstNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            firstNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            firstNameLabel.heightAnchor.constraint(equalToConstant: 30),
            firstNameLabel.widthAnchor.constraint(equalToConstant: 100),
            firstNameLabel.bottomAnchor.constraint(equalTo: lastNameLabel.topAnchor, constant: -15),
            
            lastNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            lastNameLabel.heightAnchor.constraint(equalToConstant: 30),
            lastNameLabel.widthAnchor.constraint(equalToConstant: 100),
            lastNameLabel.bottomAnchor.constraint(equalTo: loginLabel.topAnchor, constant: -15),
            
            loginLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            loginLabel.heightAnchor.constraint(equalToConstant: 30),
            loginLabel.widthAnchor.constraint(equalToConstant: 100),
            loginLabel.bottomAnchor.constraint(equalTo: passwordLbel.topAnchor, constant: -15),
            
            passwordLbel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            passwordLbel.heightAnchor.constraint(equalToConstant: 30),
            passwordLbel.widthAnchor.constraint(equalToConstant: 100),
            passwordLbel.bottomAnchor.constraint(equalTo: ageLabel.topAnchor, constant: -15),
            
            ageLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            ageLabel.heightAnchor.constraint(equalToConstant: 30),
            ageLabel.widthAnchor.constraint(equalToConstant: 100),
            ageLabel.bottomAnchor.constraint(equalTo: phoneLabel.topAnchor, constant: -15),
            
            phoneLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            phoneLabel.heightAnchor.constraint(equalToConstant: 30),
            phoneLabel.widthAnchor.constraint(equalToConstant: 100),
            phoneLabel.bottomAnchor.constraint(equalTo: emailLabel.topAnchor, constant: -15),
            
            emailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            emailLabel.heightAnchor.constraint(equalToConstant: 30),
            emailLabel.widthAnchor.constraint(equalToConstant: 100),
           
            firstNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            firstNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 30),
            firstNameTextField.widthAnchor.constraint(equalToConstant: 150),
            firstNameTextField.bottomAnchor.constraint(equalTo: lastNameTextField.topAnchor, constant: -15),
            
            lastNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 30),
            lastNameTextField.widthAnchor.constraint(equalToConstant: 150),
            lastNameTextField.bottomAnchor.constraint(equalTo: loginTextField.topAnchor, constant: -15),
            
            loginTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            loginTextField.heightAnchor.constraint(equalToConstant: 30),
            loginTextField.widthAnchor.constraint(equalToConstant: 150),
            loginTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -15),
            
            passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            passwordTextField.widthAnchor.constraint(equalToConstant: 150),
            passwordTextField.bottomAnchor.constraint(equalTo: ageTextField.topAnchor, constant: -15),
            
            ageTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            ageTextField.heightAnchor.constraint(equalToConstant: 30),
            ageTextField.widthAnchor.constraint(equalToConstant: 150),
            ageTextField.bottomAnchor.constraint(equalTo: phoneTextField.topAnchor, constant: -15),
            
            phoneTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            phoneTextField.heightAnchor.constraint(equalToConstant: 30),
            phoneTextField.widthAnchor.constraint(equalToConstant: 150),
            phoneTextField.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -15),
            
            emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 30),
            emailTextField.widthAnchor.constraint(equalToConstant: 150),
            
        ])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let nextTag = textField.tag + 1
        let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder?
        
        if nextResponder != nil {
            nextResponder?.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return false
    }
}



