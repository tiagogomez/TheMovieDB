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
    
    //Test
    var genresList = [Genres]()
    //Test
    
    private func loadSampleGenres() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UIDevice.current.userInterfaceIdiom == .pad {
            print("soy ipad")
        }
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
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
