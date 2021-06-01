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
    
    
    func fetchMoviesByGenreIdPopularityDesc(genre_id : Int,completion : @escaping(_ _movies : Array<MoviePreview>) -> ()){

        let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=34a34ddc26708de276169929baeab86f&with_genres=\(genre_id)&sort_by=popularity.desc&language=fr-FR")!
    
        let task = URLSession.shared.dataTask(with: url)  {(data, response, error) in
            
            guard let data = data else{
              return
            }
            var movies : MoviesPreview = MoviesPreview()
           movies = try! JSONDecoder().decode(MoviesPreview.self, from: data)
            completion(movies.results)
        }.resume()
    }
    
    func fetchMoviesDetailsById(movie_id : Int,completion : @escaping(_ _movie : MovieDetails) -> ()){

        let url = URL(string:
                        "https://api.themoviedb.org/3/movie/\(movie_id)?api_key=34a34ddc26708de276169929baeab86f&language=fr-FR")!
    
        let task = URLSession.shared.dataTask(with: url)  {(data, response, error) in
            guard let data = data else{
              return
            }
           let movie = try! JSONDecoder().decode(MovieDetails.self, from: data)
            completion(movie)
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
    
    func getTrailersById(movie_id : Int, completion: @escaping (_ _data : Array<MovieTrailer>) -> ()) {
        let url = URL(string:"https://api.themoviedb.org/3/movie/\(movie_id)/videos?api_key=34a34ddc26708de276169929baeab86f&language=fr-FR")!
        URLSession.shared.dataTask(with: url)  {(data, response, error) in
            guard let data = data else{
              return
            }
            let trailers : MovieTrailers = try! JSONDecoder().decode(MovieTrailers.self, from: data)
            completion(trailers.results)
        }.resume()
    }
    
}
