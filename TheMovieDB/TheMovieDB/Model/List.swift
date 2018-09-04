//
//  List.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/24/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

protocol List: class {
    weak var listDelegate: MoviesListDelegate? {get set}
    func reloadData()
}
