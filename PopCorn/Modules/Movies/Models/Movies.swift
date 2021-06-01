//
//  Movies.swift
//  PopCorn
//
//  Created by Carl Fuchs on 26/04/2021.
//

import Foundation

struct MoviesPreview : Decodable {
var results : [MoviePreview]
    init(){
        results = Array()
//        for i in 0...100 {
//            let unFilm : Movie = Movie(vtitle : "John Wick " + String(i),vsubTitle: "Parrabellum",vreleaseYear: 2019,vduration: 1,vgenres: Array(arrayLiteral: "Action","Aventure"),vsynopsis: "LoremIpsum")
//            Movies.append(unFilm)
//        }
    }
}



