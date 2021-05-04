//
//  Categories.swift
//  PopCorn
//
//  Created by Carl Fuchs on 27/04/2021.
//

import Foundation

struct Categories {
var Categories : Array<Categorie>
    init(){
        Categories = Array()
        for i in 0...8 {
            let uneCategorie: Categorie = Categorie(vid : i,vnom : "Action" + String(i))
            Categories.append(uneCategorie)
        }
    }
}
