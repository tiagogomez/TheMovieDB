//
//  GenresTableViewController.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit
import Alamofire

class GenresTableViewController: UITableViewController {
    
    @IBOutlet var tableview: UITableView!
    
    let movieFacade = MovieFacade()
    var genresList = [Genres]()
    
    private func loadSampleGenres() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieFacade.getGenres { [weak self](genres) in
            for genre in genres!{
                print("Genres: ", genre.name)
            }
            self?.genresList=(genres)!
            self?.tableview.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genresList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "GenresTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GenresTableViewCell else {             fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        let genre = genresList[indexPath.row]
        cell.genreName.text = genre.name
        cell.genreID.text = String(genre.iD)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        self.navigationController?.pushViewController(myViewController, animated: true)
    }
}
