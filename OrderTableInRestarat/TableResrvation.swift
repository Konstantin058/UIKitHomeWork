//
//  TableResrvation.swift
//  OrderTableInRestarat
//
//  Created by Константин Евсюков on 05.07.2022.
//

import Foundation
import UIKit

class TableOfReservation: UIViewController {
    
    var titleLable = UILabel()
    var fioLabel = UILabel()
    var numberOfGuestsLabel = UILabel()
    var numberOfTableLabel = UILabel()
    var reservTableLable = UILabel()
    var prepaymentLable = UILabel()
    var vipRoomLable = UILabel()
    
    var fioTextField = UITextField(frame: CGRect(x: 20, y: 150, width: 200, height: 31))
    var numberOfGuestsTextField = UITextField(frame: CGRect(x: 20, y: 250, width: 200, height: 31))
    var numberOfTableTextField = UITextField(frame: CGRect(x: 20, y: 350, width: 200, height: 31))
    
    var reservSwitch = UISwitch(frame: CGRect(x: 300, y: 435, width: 0, height: 0))
    var prepeymentSwitch = UISwitch(frame: CGRect(x: 300, y: 485, width: 0, height: 0))
    var vipRoomSwitch = UISwitch(frame: CGRect(x: 300, y: 535, width: 0, height: 0))
    
    var billButton = UIButton(frame: CGRect(x: 130, y: 600, width: 150, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createLable()
        createTextField()
        createSwitch()
        createButton()
        addSubView()
    }
    
    func createLable() {
        titleLable = UILabel(frame: CGRect(x: 100, y: 50, width: 200, height: 50))
        titleLable.text = "Tasty Grill"
        titleLable.font = .boldSystemFont(ofSize: 36)
        titleLable.textColor = .red
        titleLable.textAlignment = .center
       
        fioLabel = UILabel(frame: CGRect(x: 30, y: 100, width: 200, height: 50))
        fioLabel.font = .boldSystemFont(ofSize: 17)
        fioLabel.textColor = .red
        fioLabel.text = "ФИО"
       
        numberOfGuestsLabel = UILabel(frame: CGRect(x: 30, y: 200, width: 200, height: 50))
        numberOfGuestsLabel.font = .boldSystemFont(ofSize: 17)
        numberOfGuestsLabel.textColor = .red
        numberOfGuestsLabel.text = "Количество гостей"
        
        numberOfTableLabel = UILabel(frame: CGRect(x: 30, y: 300, width: 200, height: 50))
        numberOfTableLabel.font = .boldSystemFont(ofSize: 17)
        numberOfTableLabel.textColor = .red
        numberOfTableLabel.text = "Номер стола"
        
        reservTableLable = UILabel(frame: CGRect(x: 30, y: 420, width: 200, height: 50))
        reservTableLable.font = .boldSystemFont(ofSize: 17)
        reservTableLable.textColor = .red
        reservTableLable.text = "Бронировать стол?"
        
        prepaymentLable = UILabel(frame: CGRect(x: 30, y: 470, width: 200, height: 50))
        prepaymentLable.font = .boldSystemFont(ofSize: 17)
        prepaymentLable.textColor = .red
        prepaymentLable.text = "Предоплата?"
        
        vipRoomLable = UILabel(frame: CGRect(x: 30, y: 520, width: 200, height: 50))
        vipRoomLable.font = .boldSystemFont(ofSize: 17)
        vipRoomLable.textColor = .red
        vipRoomLable.text = "VIP комната"
    }
    
    func createTextField() {
        fioTextField.borderStyle = .roundedRect
        fioTextField.placeholder = "Введите ваше ФИО"
        fioTextField.textColor = .black
        fioTextField.font = .systemFont(ofSize: 15)
       
        numberOfGuestsTextField.borderStyle = .roundedRect
        numberOfGuestsTextField.placeholder = "Введите количество"
        numberOfGuestsTextField.textColor = .black
        numberOfGuestsTextField.font = .systemFont(ofSize: 15)
               
        numberOfTableTextField.borderStyle = .roundedRect
        numberOfTableTextField.placeholder = "Номер стола"
        numberOfTableTextField.textColor = .black
        numberOfTableTextField.font = .systemFont(ofSize: 15)
    }
    
    func createSwitch() {
        reservSwitch.setOn(true, animated: true)
        reservSwitch.addTarget(self, action: #selector(switchChangeTable), for: .valueChanged)
                
        prepeymentSwitch.setOn(true, animated: true)
        prepeymentSwitch.addTarget(self, action: #selector(switchChangePrepeyment), for: .valueChanged)
                
        vipRoomSwitch.setOn(true, animated: true)
        vipRoomSwitch.addTarget(self, action: #selector(switchChangeVipRoom), for: .valueChanged)
    }
    
    func createButton() {
        billButton.setTitle("Выставить счет", for: .normal)
        billButton.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        billButton.backgroundColor = .red
        billButton.tag = 0
    }
    
    @objc func switchChangeTable(sender: UISwitch) {
        //var reservedCost = 0
//
//        if sender.isOn {
//            reservedCost += reservedTable
//        } else {
//            print("Стол не бронировался")
//        }
    }
    
    @objc func switchChangePrepeyment(sender: UISwitch) {
        if sender.isOn {
            
        }
    }
    
    @objc func switchChangeVipRoom(sender: UISwitch) {
        
    }
    
    @objc func actionButton(sender: UIButton) {
        if sender.tag == 0 {
            let allert = UIAlertController(title: "Добрый день!", message: "Выставить чек?", preferredStyle: .alert)
            let alertOkButton = UIAlertAction(title: "Чек" , style: .default) { (action) in
                let checkList = CheckList()
                self.navigationController?.pushViewController(checkList, animated: true)
            }
            let alertCancelButton = UIAlertAction(title: "Отмена", style: .cancel)
                allert.addAction(alertOkButton)
            allert.addAction(alertCancelButton)
                self.present(allert, animated: true, completion: nil)
        }
    }
}


//MARK: Extension

extension TableOfReservation {
    private func addSubView() {
        view.addSubview(titleLable)
        view.addSubview(fioLabel)
        view.addSubview(numberOfGuestsLabel)
        view.addSubview(numberOfTableLabel)
        view.addSubview(reservTableLable)
        view.addSubview(prepaymentLable)
        view.addSubview(vipRoomLable)
        view.addSubview(fioTextField)
        view.addSubview(numberOfGuestsTextField)
        view.addSubview(numberOfTableTextField)
        view.addSubview(reservSwitch)
        view.addSubview(prepeymentSwitch)
        view.addSubview(vipRoomSwitch)
        view.addSubview(billButton)
    }
}
