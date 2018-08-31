//
//  MoviesCollectionViewController.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/21/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class MoviesCollectionViewController: UICollectionViewController {
    
    @IBOutlet var collectionMoviesView: UICollectionView!
    
    let movieFacade = MovieFacade()
    
    var moviesList = [Movie]()    
    var listType = MovieListType.topRated
    var actualNumberOfPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieFacade.getMoviesList(listType: listType, numberOfPage: actualNumberOfPage) {[weak self] (popularMovies) in
            for movie in popularMovies{
                print(movie.original_title ?? "")
            }
            self?.moviesList = popularMovies
            self?.collectionMoviesView.reloadData()
        }
        actualNumberOfPage = actualNumberOfPage + 1
        
        print(self.view.bounds.size.width)
        print(self.view.bounds.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MoviesCollectionViewCell
        let movie = moviesList[indexPath.row]
        let image_path = movie.poster_path
        if let imageUrl = URL(string: image_path!) {
            cell.movieImage.af_setImage(withURL: imageUrl)
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let myViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        myViewController.movie = moviesList[indexPath.row]
        self.navigationController?.pushViewController(myViewController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if 	indexPath.row == moviesList.count-1{
            movieFacade.getMoviesList(listType: listType,numberOfPage: actualNumberOfPage) {[weak self] (popularMovies) in
                for movie in popularMovies{
                    print(movie.original_title ?? "")
                }
                self?.moviesList.append(contentsOf: popularMovies)
                self?.collectionMoviesView.reloadData()
            }
            actualNumberOfPage = actualNumberOfPage + 1
        }
    }
}
