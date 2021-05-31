//
//  CategoriesRepository.swift
//  PopCorn
//
//  Created by Carl Fuchs on 18/05/2021.
//

import Foundation
class GenresRepository{
    var vdata : Data?;
    init(){
        let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=34a34ddc26708de276169929baeab86f&language=fr-FR")!
    
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            self.vdata = data
            let stringData = String(decoding : data!,as: UTF8.self)
            print(stringData)
        }

        task.resume()
        
    }
    
    func fetchGenres() -> Array<Genre>{
        
        
        //var  genre = try? JSONDecoder().decode(Genre.self, from: vdata!)
        guard let data = vdata else {
            var genres : Array<Genre> = Array()
            genres.append(Genre(vid: 1, vname: "Bug API"))
            return genres
            
        }
        let genres : Genres = try! JSONDecoder().decode(Genres.self, from: data)
        return genres.genres;
        
        //let Categories = try JSONDecoder().decode(Genres.self, from: vdata!)
        //let json = "{\"id\":28,\"name\": \"Action\"}"
        //let data = Data(json.utf8)
        //let jsonDecoder = JSONDecoder()
        //jsonDecoder.dataDecodingStrategy = .iso8601
        
    
    }

}



