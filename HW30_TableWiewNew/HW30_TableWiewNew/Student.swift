//
//  Ыегвуте.swift
//  HW30_TableWiewNew
//
//  Created by Константин Евсюков on 11.08.2022.
//

import Foundation
import UIKit

enum Gender {
    case male
    case female
}

struct Student {
    let fullName: String
    let score: Int
    let image: UIImage
    let gender: Gender
}

struct ImageName {
    static let person = "person"
    static let fillPerson = "person.fill"
}

struct Students {
    static func makeStudents() -> [Student] {
                        [Student(fullName: "Ivanov Ivan", score: 4, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
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
                        Student(fullName: "Potapova Svetlana", score: 5, image: UIImage(systemName: ImageName.person)!, gender: .female),
                        Student(fullName: "Imayilove Veronika", score: 4, image: UIImage(systemName: ImageName.person)!, gender: .female),
                        Student(fullName: "Leonova Ludmila", score: 3, image: UIImage(systemName: ImageName.person)!, gender: .female),
                        Student(fullName: "Saharova Elena", score: 2, image: UIImage(systemName: ImageName.person)!, gender: .female),
                        Student(fullName: "Levshova Darya", score: 2, image: UIImage(systemName: ImageName.person)!, gender: .female),
                        Student(fullName: "Makarov Dima", score: 2, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
                        Student(fullName: "Makarov Dima", score: 4, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
                        Student(fullName: "Makarov Dima", score: 4, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
                        Student(fullName: "Makarov Dima", score: 3, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
                        Student(fullName: "Makarov Dima", score: 3, image: UIImage(systemName: ImageName.fillPerson)!, gender: .male),
        ]
    }
    
    static func makeStudentsWithGroup() -> [[Student]] {
        let excellentStudent = makeStudents().filter { $0.score == 5 }
        let goodStudent = makeStudents().filter { $0.score == 4 }
        let triplesStudent = makeStudents().filter { $0.score == 3 }
        let badStudent = makeStudents().filter { $0.score == 2 }
        
        let sortExelent = excellentStudent.sorted(by: { $0.fullName < $1.fullName })
        let sortGood = goodStudent.sorted(by: { $0.fullName < $1.fullName })
        let sortTriple = triplesStudent.sorted(by: { $0.fullName < $1.fullName })
        let sortBab = badStudent.sorted(by: { $0.fullName < $1.fullName })
        
        return [sortExelent, sortGood, sortTriple, sortBab]
    }
}


