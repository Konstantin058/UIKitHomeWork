//
//  Teams.swift
//  HW31-32
//
//  Created by Константин Евсюков on 14.08.2022.
//

import Foundation
import UIKit

struct Teams {
    //let titleGroupe: String
    let titleTeam: String
    let ratingTeams: RatingTeams
    
//    init(titleGroupe: String, titleTeam: [String]) {
//        self.titleGroupe = titleGroupe
//        self.titleTeam = titleTeam
//    }
}

enum RatingTeams {
    case veryGood
    case veryBad
    case notBad
}

struct Source {
    static func makeTeams() -> [Teams] {
        [
            Teams(titleTeam: "Barselona", ratingTeams: .veryGood),
            Teams(titleTeam: "Milan", ratingTeams: .veryGood),
            Teams(titleTeam: "ManCity", ratingTeams: .veryGood),
            Teams(titleTeam: "Real", ratingTeams: .veryBad),
            Teams(titleTeam: "Bavaria", ratingTeams: .veryBad),
            Teams(titleTeam: "Inter", ratingTeams: .veryBad),
            Teams(titleTeam: "Juventus", ratingTeams: .veryBad),
            Teams(titleTeam: "Arsenal", ratingTeams: .notBad),
            Teams(titleTeam: "Liverpool", ratingTeams: .notBad),
            Teams(titleTeam: "PSG", ratingTeams: .notBad),
            Teams(titleTeam: "Borussia Dortmund", ratingTeams: .notBad),
        ]
    }
    
    static func makeContactsWithGroup() -> [[Teams]] {
        let myFavoriteTeam = makeTeams().filter { $0.ratingTeams == .veryGood }
        let myNotFavoriteTeam = makeTeams().filter { $0.ratingTeams == .veryBad }
        let interestingTeams = makeTeams().filter { $0.ratingTeams == .notBad }
        
        return [myFavoriteTeam, myNotFavoriteTeam, interestingTeams]
    }
}



/*
 Teams(titleGroupe: "", titleTeam: <#T##String#>)
 Teams(titleGroupe: "Мои любимые команды", titleTeam: ["Barselona", "Milan", "ManCity"]),
 Teams(titleGroupe: "Не любимые команды", titleTeam: ["Real", "Bavaria", "ManUnited", "Inter", "Juventus"]),
 Teams(titleGroupe: "За которыми интересно смотреть", titleTeam: ["PSG", "Arsenal", "Liverpool", "Borussia Dortmund", "Fiorentina"])
 */
