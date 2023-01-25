//
//  WindowOfRegistration.swift
//  OrderTableInRestarat
//
//  Created by Константин Евсюков on 05.07.2022.
//

import Foundation
import UIKit

class WindowOfRegistrationViewController: UIViewController {
    
    var myImageView = UIImageView()
    let logoImage = UIImage(named: "logo.png")
    var myEmailLabel = UILabel()
    var myPasswordLabel = UILabel()
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    var buttonSecondViewController = UIButton()
    
    override func viewDidLoad() {
         super.viewDidLoad()
        view.backgroundColor = .white
        
        
        createImageLogo()
        createLabel()
        createTextField()
        createButton()
        addSubView()
        makeConstraints()
    }
    
    func createImageLogo() {
        //myImageView = UIImageView(frame: CGRect(x: 130, y: 70, width: 150, height: 150))
        myImageView.image = logoImage
    }
    
    func createLabel() {
        //myEmailLabel = UILabel(frame: CGRect(x: 30, y: 250, width: 200, height: 50))
        myEmailLabel.text = "Email"
        myEmailLabel.textColor = .red
        myEmailLabel.font = .boldSystemFont(ofSize: 15)
        myEmailLabel.font = UIFont.boldSystemFont(ofSize: 14)

        //myPasswordLabel = UILabel(frame: CGRect(x: 30, y: 350, width: 200, height: 50))
        myPasswordLabel.text = "Password"
        myPasswordLabel.textColor = .red
        myPasswordLabel.font = .boldSystemFont(ofSize: 15)
        myPasswordLabel.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    func createTextField() {
        //emailTextField = UITextField(frame: CGRect(x: 20, y: 300, width: 200, height: 31))
        emailTextField.placeholder = "Введите вашу почту"
        emailTextField.borderStyle = .roundedRect
        emailTextField.textColor = .red
        emailTextField.clearButtonMode = .always
        
        //passwordTextField = UITextField(frame: CGRect(x: 20, y: 400, width: 200, height: 31))
        passwordTextField.placeholder = "Введите ваш пароль"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.textColor = .black
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearButtonMode = .always
    }
    
    func createButton() {
       // buttonSecondViewController = UIButton(frame: CGRect(x: 130, y: 550, width: 150, height: 70))
        buttonSecondViewController.setTitle("registration", for: .normal)
        buttonSecondViewController.addTarget(self, action: #selector(routeToSecondVC), for: .touchUpInside)
        buttonSecondViewController.backgroundColor = .red
    }
    
    @objc func routeToSecondVC() {
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
        let allert = UIAlertController(title: "Ошибка входа", message: "Введите логин или пароль", preferredStyle: .alert)
            let alertOkButton = UIAlertAction(title: "Ok", style: .default)
            allert.addAction(alertOkButton)
            self.present(allert, animated: true, completion: nil)
        }
        let tableResrev = TableOfReservation()
        navigationController?.pushViewController(tableResrev, animated: true)
    }
    
}

//MARK: Extension  //Еще что то я не понял, почему не видит расширение и выдает ошибку?

extension WindowOfRegistrationViewController {
    
    private func addSubView() {
        view.addSubview(myImageView)
        view.addSubview(myEmailLabel)
        view.addSubview(myPasswordLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(buttonSecondViewController)
    }
    
    private func makeConstraints() {
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        myPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        buttonSecondViewController.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            myImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            myImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            myImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            myImageView.widthAnchor.constraint(equalToConstant: 150),
            myImageView.heightAnchor.constraint(equalToConstant: 150),

            myEmailLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 40),
            myEmailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            myEmailLabel.widthAnchor.constraint(equalToConstant: 200),
            myEmailLabel.heightAnchor.constraint(equalToConstant: 30),
            
            emailTextField.topAnchor.constraint(equalTo: myEmailLabel.bottomAnchor, constant: 0),
            emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            emailTextField.widthAnchor.constraint(equalToConstant: 200),
            emailTextField.heightAnchor.constraint(equalToConstant: 31),
            
            myPasswordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            myPasswordLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            myPasswordLabel.widthAnchor.constraint(equalToConstant: 200),
            myPasswordLabel.heightAnchor.constraint(equalToConstant: 30),
            
            passwordTextField.topAnchor.constraint(equalTo: myPasswordLabel.bottomAnchor, constant: 0),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            
            buttonSecondViewController.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            buttonSecondViewController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonSecondViewController.widthAnchor.constraint(equalToConstant: 150),
            buttonSecondViewController.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}
