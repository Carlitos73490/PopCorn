//
//  MoviesRepository.swift
//  PopCorn
//
//  Created by Carl Fuchs on 18/05/2021.
//

import Foundation

class MoviesRepository{
    init(){
    }
    
    
    func fetchMoviesByGenreIdPopularityDesc(genre_id : Int,completion : @escaping(_ _movies : Array<Movie>) -> ()){

        let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=34a34ddc26708de276169929baeab86f&with_genres=\(genre_id)&sort_by=popularity.desc&language=fr-FR")!
    
        let task = URLSession.shared.dataTask(with: url)  {(data, response, error) in
            
            guard let data = data else{
              return
            }
            var movies : Movies = Movies()
           movies = try! JSONDecoder().decode(Movies.self, from: data)
            completion(movies.results)
        }.resume()
        
    }
    func getImgData(from url: URL, completion: @escaping (_ _data : Data?) -> ()) {
        URLSession.shared.dataTask(with: url)  {(data, response, error) in
            guard let data = data else{
              return
            }
            completion(data)
        }.resume()
    }
}
