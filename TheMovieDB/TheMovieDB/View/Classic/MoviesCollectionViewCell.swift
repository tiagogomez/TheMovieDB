//
//  MoviesCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/21/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    
    override func prepareForReuse() {
        movieImage.image=nil
    }
}
