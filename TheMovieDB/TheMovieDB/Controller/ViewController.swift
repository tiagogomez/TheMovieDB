//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/23/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let movieFacade = MovieFacade()
    var moviesList = [Movie]()
    var listType = MovieListType.topRated
    var list: List!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.list = TableMovieList()
        self.list.listDelegate = self
        self.view.addSubview((self.list as! UIView))

        movieFacade.getMoviesList(listType: listType) {[weak self] (popularMovies) in
            for movie in popularMovies{
                print(movie.original_title ?? "")
            }
            self?.moviesList = popularMovies
            self?.list.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        (self.list as! UIView).frame = self.view.bounds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: MoviesListDelegate{

    func configureCell(cell: ListCell, atIndexPath: IndexPath) {
        let movie = moviesList[atIndexPath.row]
        cell.title?.text = movie.original_title
        let image_path = movie.poster_path
        if let imageUrl = URL(string: image_path!) {
            cell.movieImage?.af_setImage(withURL: imageUrl)
        }
    }
    
    func numberOfItems() -> Int {
        return moviesList.count
    }
}
