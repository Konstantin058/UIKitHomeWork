//
//  RegistrationViewController.swift
//  addDayOfBirthForUser
//
//  Created by Константин Евсюков on 09.07.2022.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController {
    
    var myLabel = UILabel()
    let signLabel = UILabel()
    let emailLabel = UILabel()
    var passwordLabel = UILabel()
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    var buttonSecondViewController = UIButton()
    let buttonTooglePasswor = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLabel()
        createTextField()
        createButton()
        addSubViews()
        makeConstrains()
    }
    
    func createLabel() {
        myLabel.text = "Bitrhday Reminder"
        myLabel.textColor = .red
        myLabel.font = .boldSystemFont(ofSize: 35)
        myLabel.layer.borderWidth = 1
        myLabel.layer.borderColor = UIColor.green.cgColor
        myLabel.layer.shadowOpacity = 3
        
        emailLabel.text = "Email"
        emailLabel.textColor = .black
        emailLabel.font = .boldSystemFont(ofSize: 15)
        emailLabel.font = UIFont.boldSystemFont(ofSize: 14)

        passwordLabel.text = "Password"
        passwordLabel.textColor = .black
        passwordLabel.font = .boldSystemFont(ofSize: 15)
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    func createTextField() {
        emailTextField.placeholder = "Введите вашу почту"
        emailTextField.borderStyle = .roundedRect
        emailTextField.textColor = .black
        emailTextField.clearButtonMode = .always
        
        passwordTextField.placeholder = "Введите ваш пароль"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.textColor = .black
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardAppearance = .light
    }
    
    func createButton() {
        buttonSecondViewController.setTitle("Войти", for: .normal)
        buttonSecondViewController.addTarget(self, action: #selector(routeToSecondVC), for: .touchUpInside)
        buttonSecondViewController.backgroundColor = .red
        buttonSecondViewController.layer.cornerRadius = 20
        
        buttonTooglePasswor.setBackgroundImage(UIImage(systemName: "eye.png"), for: UIControl.State.normal)
        buttonTooglePasswor.frame = CGRect(x: passwordTextField.frame.size.height, y: passwordTextField.frame.size.width, width: 22, height: 22)
        buttonTooglePasswor.tintColor = .lightGray
        buttonTooglePasswor.setBackgroundImage(UIImage(systemName: "hidden.png"), for: UIControl.State.normal)
        buttonTooglePasswor.addTarget(self, action: #selector(toggleassword), for: .touchUpInside)
    }
    
    @objc func toggleassword() {
        let togglePassword = passwordTextField.isSecureTextEntry
        passwordTextField.isSecureTextEntry = togglePassword ? false : true
        if togglePassword {
            buttonTooglePasswor.setImage(UIImage(systemName: "eye.png"), for: .normal)
        } else {
            buttonTooglePasswor.setImage(UIImage(systemName: "hidden.png"), for: .normal)
        }
    }
    
    @objc func routeToSecondVC() {
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
        let allert = UIAlertController(title: "Ошибка входа", message: "Введите логин или пароль", preferredStyle: .alert)
            let alertOkButton = UIAlertAction(title: "Ok", style: .default)
            allert.addAction(alertOkButton)
            self.present(allert, animated: true, completion: nil)
        }
        
        let userVC = UsersViewController()
        navigationController?.pushViewController(userVC, animated: true)
        
    }
}


//MARK: Extension

extension RegistrationViewController {
    
    private func addSubViews() {
        view.addSubview(myLabel)
        view.addSubview(emailLabel)
        view.addSubview(passwordLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(buttonSecondViewController)
        view.addSubview(buttonTooglePasswor)
    }
    
    func makeConstrains() {
        [myLabel, emailLabel, passwordLabel, emailTextField, passwordTextField, buttonSecondViewController].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            myLabel.widthAnchor.constraint(equalToConstant: 300),
            myLabel.heightAnchor.constraint(equalToConstant: 100),
            
            emailLabel.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 40),
            emailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            emailLabel.widthAnchor.constraint(equalToConstant: 200),
            emailLabel.heightAnchor.constraint(equalToConstant: 30),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 0),
            emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            emailTextField.widthAnchor.constraint(equalToConstant: 250),
            emailTextField.heightAnchor.constraint(equalToConstant: 31),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            passwordLabel.widthAnchor.constraint(equalToConstant: 200),
            passwordLabel.heightAnchor.constraint(equalToConstant: 30),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 0),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 250),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            
            buttonSecondViewController.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            buttonSecondViewController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonSecondViewController.widthAnchor.constraint(equalToConstant: 150),
            buttonSecondViewController.heightAnchor.constraint(equalToConstant: 70)
        ])
 
    }
}
