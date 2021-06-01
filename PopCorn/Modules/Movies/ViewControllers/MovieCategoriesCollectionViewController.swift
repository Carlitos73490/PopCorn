//
//  MovieCategoriesCollectionViewController.swift
//  PopCorn
//
//  Created by Carl Fuchs on 27/04/2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class MovieCategoriesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    
    let inset: CGFloat = 30
        let minimumLineSpacing: CGFloat = 10
        let minimumInteritemSpacing: CGFloat = 10
        let cellsPerRow = 2
    
    var repository : GenresRepository = GenresRepository()
    var lesGenres : Array<Genre> = Array()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        repository.fetchGenres(completion: {(genres) in
            self.lesGenres = genres
            DispatchQueue.main.async(execute: { () -> Void in
                self.collectionView.reloadData()
                })
        })
    
        
        //delegate
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Register cell classes
        self.collectionView!.register(UINib(nibName : "MovieCategoriesCollectionViewCell",bundle: nil), forCellWithReuseIdentifier: MovieCategoriesCollectionViewCell.reuseId)
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let marginsAndInsets = inset * 2 + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
           let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
           return CGSize(width: itemWidth, height: itemWidth)
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return minimumLineSpacing
     }

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return minimumInteritemSpacing
     }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
           collectionView?.collectionViewLayout.invalidateLayout()
           super.viewWillTransition(to: size, with: coordinator)
       }
    


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return lesGenres.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCategoriesCollectionViewCell.reuseId, for: indexPath) as! MovieCategoriesCollectionViewCell
    
        let genre : Genre = lesGenres[indexPath.item]
        
        cell.titleLabel.text = genre.name
        cell.backgroundColor = randomColor()
        cell.layer.cornerRadius = 10
    
        return cell
    }
    
     func randomColor() -> UIColor{
        return UIColor(red: .random(in: 0.5...1),
                       green: .random(in: 0.5...1),
                       blue: .random(in: 0.5...1),
                          alpha: 1.0)
       }

    // MARK: UICollectionViewDelegate


    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }
     */
  
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        let genre : Genre = lesGenres[indexPath.item]
        //print("Categorie with title \(genre.id) touched - index path \(indexPath)")
        
        let destController : MoviesTableViewController = storyboard?.instantiateViewController(withIdentifier: "MesMovies") as!MoviesTableViewController
        destController.genre_id = genre.id
        
        //let destController : UIViewController = MoviesTableViewController(nibName //:"MovieTableViewController",bundle : nil)
        navigationController?.pushViewController(destController, animated: true)
    }
   
    
}
