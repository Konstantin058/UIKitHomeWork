//
//  SupermanViewController.swift
//  HW30_TableWiewNew
//
//  Created by Константин Евсюков on 11.08.2022.
//

/*
 Супермен.
 14. Средний бал для студентов ставьте рандомно от 2 до 5
 15. После того, как вы сгенерировали 30 студентов вам надо их разбить на группы:
 Отличники, хорошисты, троечники и двоечники
 16. Каждая группа это секция с соответствующим названием.
 17. Студенты внутри своих групп должны быть в алфовитном порядке
 18. Отобразите группы студентов с их оценками в таблице.
 Mission Impossible!
 19. Добавьте к супермену еще одну секцию, в которой вы отобразите 10 моделей цветов из задания Студент.
 20. Помните, это должно быть 2 разных типа ячеек Value1 для студентов и Default для цветов.
 */

import Foundation
import UIKit

class SupermanViewController: UIViewController {
    
    private var myTableView = UITableView()
    let idintifier = "MyCell"
    
    var students = Students.makeStudentsWithGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBar()
        createTableView()
    }
    
    func createTabBar() {
        navigationItem.title = "Superman"
        var tabbarItem = UITabBarItem()
        tabbarItem = UITabBarItem(title: "Superman", image: UIImage(named: "superman"), tag: 3)
        self.tabBarItem = tabbarItem
    }
    
    func createTableView() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: idintifier)
        myTableView.register(ConfigCell.self, forCellReuseIdentifier: "ConfigCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(myTableView)
    }
}


extension SupermanViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Отличники"
        case 1:
            return "Хорошисти"
        case 2:
            return "Троечники"
        case 3:
            return "Двоечники"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ConfigCell", for: indexPath) as? ConfigCell else { fatalError() }
        cell.configure(contact: students[indexPath.section][indexPath.row])
        
        return cell
    }
}
