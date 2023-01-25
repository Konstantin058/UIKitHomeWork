//
//  ViewController.swift
//  HW31-32
//
//  Created by Константин Евсюков on 14.08.2022.
//

/*
 Ученик
 1. Создайте контроллер с таблицей в коде без сторибордов.
 2. Заполните таблицу данными на свое усмотрение.
 3. Объедините данные в группы (секции).
 Студент.
 4. Реализуйте механизм перемещения данных между рядами и секциями.
 5. Вы должны четко понимать что и как работает и в какой последовательности поэтому повторяйте задание пока вы полностью не освоите этот механизм
 Мастер.
 6. Реализуйте удаление рядов.
 Супермен
 7. Реализуйте механизм добавления секций и рядов на ваше усмотрение.
 */

import UIKit

class ViewController: UIViewController {
    
    var myTeams = Source.makeContactsWithGroup()
    
    private var myTableView = UITableView()
    //let idintifiere = "MyCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBrButtons()
        createTableView()
        
    }
    
    func createTableView() {
        myTableView = UITableView(frame: view.bounds, style: .insetGrouped)
        myTableView.register(MyTeamsTableViewCell.self, forCellReuseIdentifier: "MyTeamsTableViewCell")
        myTableView.isEditing = false
        myTableView.dataSource = self
        myTableView.delegate = self
        view.addSubview(myTableView)
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            myTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            myTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
    func createBrButtons() {
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(actionEdit))
        navigationItem.rightBarButtonItem = editButton
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addStudent))
        navigationItem.leftBarButtonItem = addButton
    }
    
    @objc func actionEdit(sender: UIBarButtonItem) {
        myTableView.isEditing.toggle()
    }
    
    @objc func addStudent(sender: UIBarButtonItem) {
        
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Мои любимые команды"
        case 1:
            return "Не любимые команды"
        case 2:
            return "За которыми интересно смотреть"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myTeams[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyTeamsTableViewCell") as? MyTeamsTableViewCell else { return fatalError() as! UITableViewCell }
        cell.configure(team: myTeams[indexPath.section][indexPath.row])
        
        return cell
    }
    
    //delete
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        myTeams[indexPath.section].remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }

    //передвежение ячеек
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let team = myTeams[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        myTeams[destinationIndexPath.section].insert(team, at: destinationIndexPath.row)
    }
}

