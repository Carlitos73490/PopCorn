//
//  CategoriesRepository.swift
//  PopCorn
//
//  Created by Carl Fuchs on 18/05/2021.
//

import Foundation
class GenresRepository{
    init(){
    }
    
    func fetchGenres(completion : @escaping(_ _genres : Array<Genre>) -> ()){
        
        let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=34a34ddc26708de276169929baeab86f&language=fr-FR")!
    
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
           
            guard let data = data else {
                var genres : Array<Genre> = Array()
                genres.append(Genre(vid: 1, vname: "Bug API"))
                completion(genres)
                return
            }
            let genres : Genres = try! JSONDecoder().decode(Genres.self, from: data)
            completion(genres.genres)
        }

        task.resume()
        
     
        
        //let Categories = try JSONDecoder().decode(Genres.self, from: vdata!)
        //let json = "{\"id\":28,\"name\": \"Action\"}"
        //let data = Data(json.utf8)
        //let jsonDecoder = JSONDecoder()
        //jsonDecoder.dataDecodingStrategy = .iso8601
        
    
    }

}



