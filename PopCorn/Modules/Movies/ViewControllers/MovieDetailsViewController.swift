//
//  MovieDetailsViewController.swift
//  PopCorn
//
//  Created by Carl Fuchs on 26/04/2021.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var MovieTitle: UILabel!
    @IBOutlet weak var MovieSubTitle: UILabel!
    @IBOutlet weak var MovieSynopsis: UITextView!
    @IBOutlet weak var MovieYear: UILabel!
    @IBOutlet weak var MovieDuration: UILabel!
    @IBOutlet weak var MovieGenres: UIStackView!
    @IBOutlet weak var MoviePoster: UIImageView!
    @IBOutlet weak var MovieBackground: UIImageView!
    @IBOutlet weak var TrailersStackView: UIStackView!
    
    var repository : MoviesRepository
    var MoviePreview : MoviePreview?
    
    required init?(coder: NSCoder) {
        repository = MoviesRepository()
        super.init(coder: coder)
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MoviePoster.image = nil
        MovieBackground.image = nil
     
        repository.fetchMoviesDetailsById(movie_id: MoviePreview!.id, completion: {(movie) in
        
            let url2 = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.backdrop_path)")!
           
            if movie.video {
                self.repository.getTrailersById(movie_id: self.MoviePreview!.id , completion: {(data) in
                    
                    var lien : String = ""
                    data.forEach{(trailer) in
                        
                        if(trailer.site == "youtube"){
                            lien = "https://www.youtube.com/watch?v=\(trailer.key)"
                        } else if(trailer.site == "vimeo"){
                            lien = "https://vimeo.com/\(trailer.key)"
                        }
                        
                        DispatchQueue.main.async(execute: { () -> Void in
                            let TrailerButton = UIButton()
                            TrailerButton.setTitle(lien,for: .normal)
                            TrailerButton.addTarget(self, action: "trailerClicked:", for: .touchUpInside)
                           
                            self.TrailersStackView.addArrangedSubview(TrailerButton)
                            })
                    }
                    
                })
            } else {
                DispatchQueue.main.async(execute: { () -> Void in
                    let textLabel = UILabel()
                    textLabel.text  = "Pas de videos"
                    textLabel.textAlignment = .center
                    self.TrailersStackView.addArrangedSubview(textLabel)
                    })
            }
           


            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.hour, .minute, .second]
            formatter.unitsStyle = .full
            let movieDuration = formatter.string(from: TimeInterval((movie.runtime * 60)))!
            DispatchQueue.main.async(execute: { () -> Void in
                self.MovieDuration.text = String(movieDuration)
                })

            
            movie.genres.forEach{(genre) in
                DispatchQueue.main.async(execute: { () -> Void in
                    let textLabel = UILabel()
                    textLabel.text  = genre.name
                    textLabel.textAlignment = .center
                    self.MovieGenres.addArrangedSubview(textLabel)
                    })
            }
            
            self.repository.getImgData(from: url2, completion: {(data) in
                guard let data = data else{
                    return}
                DispatchQueue.main.async(execute: { () -> Void in
                    self.MovieBackground.image =  UIImage(data: data)
                    })
                    })
            
           
        })
        
        MovieTitle.text = MoviePreview?.title
        //MovieSubTitle.text = unFilm?.subTitle
        MovieSynopsis.text = MoviePreview?.overview
        MovieYear.text = String(MoviePreview!.release_date)
   
     
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(MoviePreview!.poster_path)")!
        
        repository.getImgData(from: url, completion: {(data) in
            guard let data = data else{
                DispatchQueue.main.async(execute: { () -> Void in
                    self.MoviePoster.image = UIImage(named: "img")
                    })
                return}
            DispatchQueue.main.async(execute: { () -> Void in
        self.MoviePoster.image =  UIImage(data: data)                })
    })
        

        
    }

    


    @IBAction func playBA(_ sender: Any) {
        openUrl(url : URL(string: "https://www.youtube.com/watch?v=YIx4nbTSV_Q")!)
    }
    
    @IBAction func trailerClicked(_ sender: UIButton) {
        openUrl(url : URL(string: sender.title( for: .normal)!)!)
    }
    
    
    func openUrl(url : URL) {
        UIApplication.shared.open(url)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
