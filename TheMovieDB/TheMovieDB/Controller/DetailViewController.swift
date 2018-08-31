//
//  DetailViewController.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/27/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movie:Movie? = nil
    
    @IBOutlet weak var detailMovieImage: UIImageView!
    @IBOutlet weak var detailMovieOveview: UITextView!
    @IBOutlet weak var detailVoteAverage: UILabel!
    @IBOutlet weak var detailReleaseDate: UILabel!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailMovieOveview.text = movie?.overview
        self.navigationItem.title = movie?.original_title
        let image_path = movie?.backdrop_path
        if let imageUrl = URL(string: image_path!) {
            self.detailMovieImage.af_setImage(withURL: imageUrl)
        }
        self.detailVoteAverage.text = String(describing: (movie?.vote_average)!)
        print(String(describing: movie?.vote_average))
        self.detailReleaseDate.text = movie?.release_date
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
