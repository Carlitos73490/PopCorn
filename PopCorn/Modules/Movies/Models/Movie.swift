//
//  Movie.swift
//  PopCorn
//
//  Created by Carl Fuchs on 26/04/2021.
//

import Foundation

struct Movie : Decodable{
    var title : String
    //var subTitle : String
    var release_date : String
    //var duration : Int
    var genre_ids : Array<Int>
    var overview : String
    var poster_path : String
    
//    init(vtitle: String,vsubTitle : String,vreleaseYear : Int,vduration :Int, vgenres : Array<String>,voverview : String) {
//        title = vtitle
//        subTitle = vsubTitle
//        releaseYear = vreleaseYear
//        duration = vduration
//        genres = vgenres
//        overview = voverview
//       }
    init(title: String,release_date : String, genres : Array<Int>,overview : String,poster_path :String) {
        self.title = title
        self.release_date = release_date
        self.genre_ids = genres
        self.overview = overview
        self.poster_path = poster_path
       }

}
