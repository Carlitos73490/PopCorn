//
//  Movie.swift
//  PopCorn
//
//  Created by Carl Fuchs on 26/04/2021.
//

import Foundation

struct MoviePreview : Decodable{
    var id : Int
    var title : String
    //var subTitle : String
    var release_date : String?
    var overview : String
    var poster_path : String?
    

    init(id : Int,title: String,release_date : String?, genres : Array<Int>,overview : String,poster_path :String?) {
        self.id = id
        self.title = title
        self.release_date = release_date
        self.overview = overview
        self.poster_path = poster_path
       }

}

struct MovieDetails : Decodable{
    
    var genres: Array<MovieGenres>
    var backdrop_path : String
    var runtime : Int
    var video : Bool


    init(title: String,release_date : String, genres : Array<MovieGenres>,backdrop_path : String,runtime : Int,video : Bool) {
        self.genres = genres
        self.backdrop_path = backdrop_path
        self.runtime = runtime
        self.video = video
       }

}

struct MovieGenres : Decodable{
    var id : Int
    var name : String
    
    init(id : Int,name : String) {
        self.id = id
        self.name = name
        
       }
}

struct MovieTrailers : Decodable{
    var results : [MovieTrailer]
    
    init(results: [MovieTrailer]) {
       self.results = results
   }
}

struct MovieTrailer : Decodable{
 
    var key : String
    var name : String
    var site : String
    var size : Int
    var type : String
    
    init(key: String, name: String, site: String, size: Int, type: String) {
       self.key = key
       self.name = name
       self.site = site
       self.size = size
       self.type = type
   }
}
