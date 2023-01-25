//
//  MasterViewController.swift
//  HW30_TableWiewNew
//
//  Created by Константин Евсюков on 11.08.2022.
//
/*
 Мастер.
 9. Возвращаемся к слудентам. Сгенерируйте 20-30 разных студентов.
 10. В таблице создавайте не default ячейку а Value1. В этом случае у вас появится еще одна UILabel – detailLabel.
 11. В textLabel пишите имя и фамилию студента, а в detailLabel его средний бал.
 12. Если средний бал низкий – окрашивайте имя студента в красный цвет.
 13. Отсортируйте студентов в алфaвитном порядке и отобразите в таблице.
 */

import Foundation
import UIKit

class MasterViewController: UIViewController {
    
    private var myTableView = UITableView()
    let idintifier = "MyCell"
    
    var students = [Student(fullName: "Ivanov Ivan", score: 4, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
                    Student(fullName: "Petrov Petr", score: 5, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
                    Student(fullName: "Chizov Alex", score: 2, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
                    Student(fullName: "Ivanova Inna", score: 5, image: UIImage(systemName: ImageName.person)!, gender: .female),
                    Student(fullName: "Sidorova Elena", score: 3, image: UIImage(systemName: ImageName.person)!, gender: .female),
                    Student(fullName: "Gorbunova Evgeniya", score: 5, image: UIImage(systemName: ImageName.person)!, gender: .female),
                    Student(fullName: "Gelver Vladimir", score: 4, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
                    Student(fullName: "Hatit Murat", score: 4, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
                    Student(fullName: "Ryabencko Pavel", score: 2, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
                    Student(fullName: "Chirkov Alexander", score: 2, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
                    Student(fullName: "Lozovic Sergey", score: 3, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
                    Student(fullName: "Ackmanov Dmitriy", score: 5, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
                    Student(fullName: "Ice Cube", score: 3, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
                    Student(fullName: "Sidorova Elena", score: 3, image: UIImage(systemName: ImageName.person)!, gender: .female),
                    Student(fullName: "Sholohov Jack", score: 5, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
                    Student(fullName: "Makarov Dima", score: 4, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
                    Student(fullName: "Katrova Maria", score: 2, image: UIImage(systemName: ImageName.person)!, gender: .female),
                    Student(fullName: "Semenova Anna", score: 3, image: UIImage(systemName: ImageName.person)!, gender: .female),
                    Student(fullName: "Yaroshenko Irina", score: 5, image: UIImage(systemName: ImageName.person)!, gender: .female),
                    Student(fullName: "Potapova Svetlana", score: 3, image: UIImage(systemName: ImageName.person)!, gender: .female),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBar()
        createTableView()
    }
    
    func createTabBar() {
        navigationItem.title = "Master"
        var tabbarItem = UITabBarItem()
        tabbarItem = UITabBarItem(title: "Master", image: UIImage(named: "master"), tag: 2)
        self.tabBarItem = tabbarItem
    }
    
    func createTableView() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: idintifier)
        myTableView.register(ConfigCell.self, forCellReuseIdentifier: "ConfigCell")
        myTableView.dataSource = self
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(myTableView)
    }
}


extension MasterViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ConfigCell", for: indexPath) as? ConfigCell else { fatalError() }
       
        let sortStudents = students.sorted(by: { $0.fullName < $1.fullName })
        cell.configure(contact: sortStudents[indexPath.row])
        
        if let text = cell.scoreLabel.text, let score = Int(text) {
            switch score {
            case 5:
                cell.backgroundColor = .yellow
            case 4:
                cell.backgroundColor = .green
            case 3:
                cell.backgroundColor = .blue
            case 2:
                cell.backgroundColor = .red
            default:
                break
            }
        }
        return cell
    }
}
