//
//  Movie.swift
//  PopCorn
//
//  Created by Carl Fuchs on 26/04/2021.
//

import Foundation

struct Movie {
    var title : String
    var subTitle : String
    var releaseYear : Int
    var duration : Int
    var genres : Array<String>
    var synopsis : String
    
    init(vtitle: String,vsubTitle : String,vreleaseYear : Int,vduration :Int, vgenres : Array<String>,vsynopsis : String) {
        title = vtitle
        subTitle = vsubTitle
        releaseYear = vreleaseYear
        duration = vduration
        genres = vgenres
        synopsis = vsynopsis
       }

}
