//
//  GenresTableViewCell.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class GenresTableViewCell: UITableViewCell {
    
    @IBOutlet weak var genreID: UILabel!
    @IBOutlet weak var genreName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
