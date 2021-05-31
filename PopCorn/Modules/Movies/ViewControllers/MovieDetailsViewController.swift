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
    @IBOutlet weak var MovieAffiche: UIImageView!
    var unFilm : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let unFilm : Movie = Movie(vtitle : "John Wick 3",vsubTitle: "Parrabellum",vreleaseYear: 2019,vduration: 1,vgenres: Array(arrayLiteral: "Action","Aventure"),vsynopsis: "LoremIpsum")
        // Do any additional setup after loading the view.
        
    
        
        MovieTitle.text = unFilm?.title
        //MovieSubTitle.text = unFilm?.subTitle
        MovieSynopsis.text = unFilm?.overview
        MovieYear.text = String(unFilm!.release_date)
        //MovieDuration.text = String(unFilm!.duration)
     
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(unFilm!.poster_path)")!
        
        DispatchQueue.main.async(execute: { () -> Void in
            let repository = MoviesRepository()
            repository.getImgData(from: url, completion: {(data) in
                guard let data = data else{
                    self.MovieAffiche.image = UIImage(named: "img")
                    return}
                    self.MovieAffiche.image =  UIImage(data: data)
                       })
            })
    }


   
    
  
    
    var urlBA : String = "https://www.youtube.com/watch?v=YIx4nbTSV_Q"


    @IBAction func playBA(_ sender: Any) {
        print("test");
        if let url = URL(string: urlBA) {
            UIApplication.shared.open(url)
        }
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
