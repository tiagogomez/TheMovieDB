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
    var listType = MovieListType.popular
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieFacade.getMoviesList(listType: listType) {[weak self] (popularMovies) in
            for movie in popularMovies{
                print(movie.original_title ?? "")
            }
            self?.moviesList = popularMovies
            self?.collectionMoviesView.reloadData()
        }
        print(self.view.bounds.size.width)
        print(self.view.bounds.size.height)
                
        /*movieFacade.getMovieImage(image_path: image_path) { (image) in
            self.movieImage = image
            self.collectionMoviesView.reloadData()
        }*/
        /*collectionView?.register(UINib.init(nibName:"Cell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        if let flowLayout = collectionMoviesView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width:1,height:1)
        }*/
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

}
