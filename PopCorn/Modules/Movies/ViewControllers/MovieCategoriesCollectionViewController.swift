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
        cell.backgroundColor = getColor(i : indexPath.item)
        cell.layer.cornerRadius = 10
    
        return cell
    }
    
    func getColor(i : Int) -> UIColor{
//        return UIColor(red: .random(in: 0.5...1),
//                       green: .random(in: 0.5...1),
//                       blue: .random(in: 0.5...1),
//                          alpha: 1.0)
        var colors : Array<UIColor> = Array()
        colors.append(UIColor(red: CGFloat(250/255.0), green: CGFloat(211/255.0), blue: CGFloat(144/255.0), alpha: CGFloat(1.0)))
        colors.append(UIColor(red: CGFloat(248/255.0), green: CGFloat(194/255.0), blue: CGFloat( 145/255.0), alpha: CGFloat(1.0)))
        colors.append(UIColor(red: 0.90, green: 0.56, blue: 0.15, alpha: 1.00))
        colors.append(UIColor(red: CGFloat(106/255.0), green: CGFloat(137/255.0), blue: CGFloat( 204/255.0), alpha: CGFloat(1.0)))
        colors.append(UIColor(red: CGFloat(130/255.0), green: CGFloat(204/255.0), blue: CGFloat( 221/255.0), alpha: CGFloat(1.0)))
        colors.append(UIColor(red: CGFloat(184/255.0), green: CGFloat(184/255.0), blue: CGFloat( 148/255.0), alpha: CGFloat(1.0)))
        colors.append(UIColor(red: CGFloat(229/255.0), green: CGFloat(229/255.0), blue: CGFloat( 80/255.0), alpha: CGFloat(1.0)))
        colors.append(UIColor(red: 0.29, green: 0.41, blue: 0.74, alpha: 1.00))
        colors.append(UIColor(red: 0.12, green: 0.22, blue: 0.60, alpha: 1.00))
        colors.append(UIColor(red: 0.38, green: 0.64, blue: 0.74, alpha: 1.00))
        colors.append(UIColor(red: 0.47, green: 0.88, blue: 0.56, alpha: 1.00))
        colors.append(UIColor(red: 0.98, green: 0.60, blue: 0.23, alpha: 1.00))
        colors.append(UIColor(red: 0.92, green: 0.18, blue: 0.02, alpha: 1.00))
        colors.append(UIColor(red: 0.12, green: 0.22, blue: 0.60, alpha: 1.00))
        colors.append(UIColor(red: CGFloat(246/255.0), green: CGFloat(246/255.0), blue: CGFloat( 59/255.0), alpha: CGFloat(1.0)))
        colors.append(UIColor(red: 0.24, green: 0.04, blue: 0.60, alpha: 1.00))
        colors.append(UIColor(red: 0.72, green: 0.08, blue: 0.25, alpha: 1.00))
        colors.append(UIColor(red: 0.24, green: 0.39, blue: 0.51, alpha: 1.00))
        colors.append(UIColor(red: 0.22, green: 0.68, blue: 0.66, alpha: 1.00))
        colors.append(UIColor(red: 0.05, green: 0.14, blue: 0.38, alpha: 1.00))
        colors.append(UIColor(red: 0.04, green: 0.24, blue: 0.38, alpha: 1.00))
        colors.append(UIColor(red: 0.03, green: 0.60, blue: 0.57, alpha: 1.00))
        return colors[i % colors.count]
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
