//
//  StudentViewController.swift
//  HW30_TableWiewNew
//
//  Created by Константин Евсюков on 11.08.2022.
//
/*
 Студент.
 5. Теперь создайте класс, который содержит цвет и нейм.
 6. В viewDidLoad сгенерируйте 1000 объектов такого класса по принципу из ученика
 7. Положите их в массив и отобразите в таблице
 8. В этом случае когда вы будете листать назад вы увидете те же ячейки, что там и были, а не новые рандомные.
 */

import Foundation
import UIKit

class StudentViewController: UIViewController {
    
    private var myTableView = UITableView()
    let idintifier = "MyCell"
    var randomColors = [UIColor]()
    var color: [Int: UIColor?] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBar()
        createTableView()
        //appendInRamdomColors()
    }
    
    func createTabBar() {
        navigationItem.title = "Student"
        var tabbarItem = UITabBarItem()
        tabbarItem = UITabBarItem(title: "Student", image: UIImage(named: "student"), tag: 1)
        self.tabBarItem = tabbarItem
    }
    
    func createTableView() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: idintifier)
        myTableView.dataSource = self
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(myTableView)
    }
    
    func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        return color
    }
    
//    func appendInRamdomColors() {
//
//
//    }
}


extension StudentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let randomColor = randomColor()
        
        for _ in 0...999 {
            randomColors.append(randomColor)
        }
        
        return randomColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idintifier, for: indexPath)
        let component = randomColors[indexPath.row]
       // cell.textLabel?.text = "\(component)"
        let randomColor = randomColor()
        cell.selectionStyle = .none
        cell.backgroundColor = randomColor
        
        return cell
    }
}


//Почуму он все равно меняет цвет? Я понимаю что нужно инициализировать компонент, но куда его прибабахать?))
