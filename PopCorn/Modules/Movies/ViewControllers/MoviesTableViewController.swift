//
//  MoviesTableViewController.swift
//  PopCorn
//
//  Created by Carl Fuchs on 26/04/2021.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    var genre_id : Int?
    var repository : MoviesRepository = MoviesRepository()
    var lesMovies : Array<MoviePreview> = Array()
    
    
    override func viewDidLoad() {

    
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName : "MovieTableViewCell",bundle: nil), forCellReuseIdentifier: MovieTableViewCell.reuseId)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        guard let genre_id : Int = genre_id else {
           return
        }
        repository.fetchMoviesByGenreIdPopularityDesc(genre_id: genre_id,completion: {(responseMovies) in
            self.lesMovies = responseMovies
            DispatchQueue.main.async(execute: { () -> Void in
                self.tableView.reloadData()
                })
        })
     
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lesMovies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseId, for: indexPath) as! MovieTableViewCell

        let movie : MoviePreview = lesMovies[indexPath.item]
        cell.titleLabel.text = movie.title
        //cell.subTitleLabel.text = movie.subTitle
        cell.dateLabel.text = String(movie.release_date)
        //cell.shortSynopsisLabel.text = String(movie.overview.prefix(50))
        cell.shortSynopsisLabel.text = movie.overview
        cell.previewImage.image = nil
        let url = URL(string: "https://image.tmdb.org/t/p/w154/\(movie.poster_path)")!
        
        repository.getImgData(from: url, completion: {(data) in
            guard let data = data else{
                DispatchQueue.main.async(execute: { () -> Void in
                    cell.previewImage.image = UIImage(named: "img")
                })
                return}
            DispatchQueue.main.async(execute: { () -> Void in
                cell.previewImage.image =  UIImage(data: data)
            })
        })
       
       
            
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath : IndexPath){
        //print(indexPath)
        let movie : MoviePreview = lesMovies[indexPath.item]
        //print("Movie with title \(movie.title) touched - index path \(indexPath)")
        
        let destController : MovieDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "MovieDetails") as!MovieDetailsViewController
        destController.MoviePreview = movie
        
        //let destController : UIViewController = MovieDetailsViewController(nibName :"MovieDetailsViewController",bundle : nil)
        navigationController?.pushViewController(destController, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
