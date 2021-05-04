//
//  MovieCategoriesCollectionViewCell.swift
//  PopCorn
//
//  Created by Carl Fuchs on 04/05/2021.
//

import UIKit

class MovieCategoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    

    
    static let reuseId : String = "MovieCategoriesCollectionViewCellReuseID"

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = nil
    }

    
}
