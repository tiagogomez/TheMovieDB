//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/23/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
        
    let movieFacade = MovieFacade()
    var moviesList = [Movie]()
    let listType = MovieListType.popular
    var actualNumberOfPage = 1
    
    var list: List!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var myView: UIView?
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            print("Soy Telefono")
            self.list = TableMovieList()
        case .pad:
            print("Soy Ipad")
            self.list = CollectionMovieList()
        default:
            self.list = TableMovieList()
        }
        myView = (self.list as! UIView)
        self.list.listDelegate = self
        self.view.addSubview((self.list as! UIView))
        myView?.translatesAutoresizingMaskIntoConstraints = false
        myView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        myView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        myView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true

        movieFacade.getMoviesList(listType: listType, numberOfPage: 1) {[weak self] (listMovies) in
            for movie in listMovies{
                print(movie.original_title ?? "")
            }
            self?.moviesList = listMovies
            self?.list.reloadData()
        }
        actualNumberOfPage = actualNumberOfPage + 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        (self.list as! UIView).frame = self.view.bounds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MainViewController: MoviesListDelegate{
    
    func willDisplayCell(atIndexPath: IndexPath) {
        if atIndexPath.row == moviesList.count-1{
            movieFacade.getMoviesList(listType: listType,numberOfPage: actualNumberOfPage) {[weak self] (popularMovies) in
                for movie in popularMovies{
                    print(movie.original_title ?? "")
                }
                self?.moviesList.append(contentsOf: popularMovies)
                self?.list.reloadData()
            }
            actualNumberOfPage = actualNumberOfPage + 1
        }
    }
    
    func didSelectCell(atIndexPath: IndexPath) {
        let myViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        myViewController.movie = moviesList[atIndexPath.row]
        self.navigationController?.pushViewController(myViewController, animated: true)
    }

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
