//
//  LearnerViewController.swift
//  HW30_TableWiewNew
//
//  Created by Константин Евсюков on 11.08.2022.
//
/*
 Ученик.
 1. Создайте таблицу которая содержит 1000 разных ячеек.
 2. для каждой ячейки генирируйте радномный цвет.
 3. RGB данные пишите в тексте ячейки, например: RGB(10,20,255)
 4. Также раскрашивайте текст ячейки этим цветом.
 */

import Foundation
import UIKit

class LearnerViewController: UIViewController {
    
    private var myTableView = UITableView()
    let idintifier = "MyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBar()
        createTableView()
    }
    
    func createTabBar() {
        navigationItem.title = "Learner"
        var tabbarItem = UITabBarItem()
        tabbarItem = UITabBarItem(title: "Learner", image: UIImage(named: "learner"), tag: 0)
        self.tabBarItem = tabbarItem
    }
    
    func createTableView() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: idintifier)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "RandomColor")
        myTableView.dataSource = self
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(myTableView)
    }
}


extension LearnerViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RandomColor", for: indexPath)
        cell.selectionStyle = .none
        let randomColor = RandomColor()
        //let randomColor = randomColor()
        let red = String(format: "%.2f", randomColor.red)
        let green = String(format: "%.2f", randomColor.green)
        let blue = String(format: "%.2f", randomColor.blue)
        cell.textLabel?.text = "R - \(red) G - \(green) B - \(blue)"
        cell.backgroundColor = UIColor(red: randomColor.red, green: randomColor.green, blue: randomColor.blue, alpha: 1)

        return cell
    }
    
}
