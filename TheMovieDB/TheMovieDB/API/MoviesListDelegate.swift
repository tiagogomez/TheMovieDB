//
//  MovieDBDelegate.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/23/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

protocol MoviesListDelegate: class {
    
    func numberOfItems() -> Int
    func configureCell(cell: ListCell, atIndexPath: IndexPath)
    func didSelectCell(atIndexPath: IndexPath)
    func willDisplayCell(atIndexPath: IndexPath)
}
