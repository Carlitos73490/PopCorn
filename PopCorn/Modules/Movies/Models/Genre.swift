//
//  Categorie.swift
//  PopCorn
//
//  Created by Carl Fuchs on 27/04/2021.
//

import Foundation

struct Genre : Decodable{
    var id : Int
    var name : String
   
   init(vid: Int,vname : String) {
        id = vid
       name = vname
      }

}
