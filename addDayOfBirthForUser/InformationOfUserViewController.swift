//
//  InformationOfUserViewController.swift
//  addDayOfBirthForUser
//
//  Created by Константин Евсюков on 09.07.2022.
//

import Foundation
import UIKit
import PhotosUI
import Photos

class InformationOfUserViewController: UIViewController, PHPickerViewControllerDelegate {
    
    private var barButton = UIBarButtonItem()
    private let imageView = UIImageView()
    private var buttonAddFoto = UIButton()
    private let nameField = UITextField()
    private let dateField = UITextField()
    private let ageField = UITextField()
    private let sexField = UITextField()
    private let instagramField = UITextField()
    var sex = ["woman", "man"]
    let agePicker = UIPickerView()
    let sexPicker = UIPickerView()
    let dataPicker = UIDatePicker()
    
    private let addUser: (User) -> ()
    
    init(addUser: @escaping (User) -> ()) {
        self.addUser = addUser
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        
        configureNavigationBar()
        createButton()
        createTextField()
        creatPicker()
        toolBarForAll()
        addSubViews()
        makeConstraints()
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.backButtonTitle = "Назад"
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(routeToSecondVC))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить", style: .done, target: self, action: #selector(routeToSecondVC))
    }
    
    func createButton() {
        buttonAddFoto.setTitle("Добавить фото", for: .normal)
        buttonAddFoto.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        buttonAddFoto.backgroundColor = .red
        buttonAddFoto.layer.cornerRadius = 10
    }
    
    @objc func actionButton(sender: Any) {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 1
        config.filter = PHPickerFilter.images
        let vc = PHPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        results.forEach { results in
            results.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] reading, error in
                DispatchQueue.main.async {
                    guard let image = reading as? UIImage, error == nil else { return }
                    self?.imageView.image = image
                }
            }
        }
    }
    
    func createTextField() {
        nameField.placeholder = "Введите ваше имя"
        nameField.borderStyle = .roundedRect
        nameField.textColor = .black
        nameField.backgroundColor = .yellow.withAlphaComponent(3)
        
        ageField.placeholder = "Введите возраст"
        ageField.borderStyle = .roundedRect
        ageField.inputView = agePicker
        ageField.backgroundColor = .yellow.withAlphaComponent(10)
        
        sexField.placeholder = "Выберите пол"
        sexField.borderStyle = .roundedRect
        sexField.inputView = sexPicker
        sexField.backgroundColor = .yellow.withAlphaComponent(10)
        
        dateField.placeholder = "Выберите дату"
        dateField.borderStyle = .roundedRect
        dateField.inputView = dataPicker
        dateField.backgroundColor = .yellow.withAlphaComponent(10)
    }
    
    func creatPicker() {
        agePicker.delegate = self
        agePicker.dataSource = self
        agePicker.tag = 1
        
        sexPicker.delegate = self
        sexPicker.dataSource = self
        sexPicker.tag = 2
        
        dataPicker.datePickerMode = .date
        dataPicker.addTarget(self, action: #selector(getDateFromPicker), for: .touchUpInside)
        
    }
    
    func toolBarForAll() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        ageField.inputAccessoryView = toolBar
        sexField.inputAccessoryView = toolBar
        dateField.inputAccessoryView = toolBar
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexSpace, doneButton], animated: true)
    }
    
    @objc func doneAction(sender: Any) {
        getDateFromPicker()
        view.endEditing(true)
    }
    
    @objc func getDateFromPicker() {
        let formater = DateFormatter()
        formater.dateStyle = .medium
        dateField.text = formater.string(from: dataPicker.date)
        dateField.resignFirstResponder()
    }
    
    @objc func routeToSecondVC() {
        let name = nameField.text ?? ""
        let age = ageField.text! +   " лет"
        let user = User(name: name, age: age)
        addUser(user)
        navigationController?.popViewController(animated: true)
    }    
}

//MARK: Extension
extension InformationOfUserViewController {
    
    private func addSubViews() {
        [imageView, buttonAddFoto, nameField, ageField, dateField, sexField, instagramField].forEach { view.addSubview($0) }
    }
    
    private func makeConstraints() {
        [imageView, buttonAddFoto, nameField, ageField, dateField, sexField, instagramField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: buttonAddFoto.topAnchor, constant: -30),
            
            buttonAddFoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonAddFoto.heightAnchor.constraint(equalToConstant: 30),
            buttonAddFoto.widthAnchor.constraint(equalToConstant: 150),
            buttonAddFoto.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: -50),
            
            nameField.heightAnchor.constraint(equalToConstant: 30),
            nameField.widthAnchor.constraint(equalToConstant: 300),
            nameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameField.bottomAnchor.constraint(equalTo: ageField.topAnchor, constant: -30),
            
            ageField.heightAnchor.constraint(equalToConstant: 30),
            ageField.widthAnchor.constraint(equalToConstant: 300),
            ageField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageField.bottomAnchor.constraint(equalTo: sexField.topAnchor, constant: -30),
            
            sexField.heightAnchor.constraint(equalToConstant: 30),
            sexField.widthAnchor.constraint(equalToConstant: 300),
            sexField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sexField.bottomAnchor.constraint(equalTo: dateField.topAnchor, constant: -30),
            
            dateField.heightAnchor.constraint(equalToConstant: 30),
            dateField.widthAnchor.constraint(equalToConstant: 300),
            dateField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
   
}

extension InformationOfUserViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            let result = "\(row)"
            return result
        case 2:
            return sex[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            ageField.text = "\(row)"
        case 2:
            sexField.text = sex[row]
        default:
            break
        }
    }
}

    

extension InformationOfUserViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return 100
        case 2:
            return sex.count
        default:
            return 1
        }
    }
}

