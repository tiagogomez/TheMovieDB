//
//  ListCell.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/24/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

protocol ListCell: class {
    weak var title : UILabel! {get}
    weak var movieImage : UIImageView! {get}
}
