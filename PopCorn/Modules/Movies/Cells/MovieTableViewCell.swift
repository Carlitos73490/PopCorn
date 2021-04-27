//
//  MovieTableViewCell.swift
//  PopCorn
//
//  Created by Carl Fuchs on 26/04/2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var shortSynopsisLabel: UILabel!
    
    static let reuseId : String = "MovieTableViewCellReuseID"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.text = nil
        subTitleLabel.text = nil
        dateLabel.text = nil
        shortSynopsisLabel.text = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
        // Configure the view for the selected state
    }
    
}
