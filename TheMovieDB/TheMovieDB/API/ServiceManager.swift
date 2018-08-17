//
//  ServiceManager.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/16/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import Alamofire

final class ServiceManager {
    
    private let genresUrl = "https://api.themoviedb.org/3/genre/movie/list?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US"
    private var genres = [Genres]()
    
    private let popularUrl = "https://api.themoviedb.org/3/movie/popular?api_key=1f4d7de5836b788bdfd897c3e0d0a24b"
    private var movies = [Movie]()
    
    private let topRatedUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b"
    
    func getGenres(completionHandler:@escaping ([Genres]?) -> Void){
        Alamofire.request(genresUrl).responseJSON { response in
            /*print("Request: \(String(describing: response.request))")   // original url request
             print("Response: \(String(describing: response.response))") // http url response
             print("Result: \(response.result)")                         // response serialization result
             
             if let json = response.result.value {
             print("JSON: \(json)") // serialized json response
             }
             
             if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
             print("Data: \(utf8Text)") // original server data as UTF8 string
             }*/
            
            if let genreJSON = response.result.value{
                let movieJSON:Dictionary = genreJSON as! [String:Any]
                let movieGenre = movieJSON["genres"] as! [[String:Any]]
                var varID:Int
                var varName:String
                for i in 0..<movieGenre.count{
                    varID = movieGenre[i]["id"] as! Int
                    varName = movieGenre[i]["name"] as! String
                    
                    let genre = Genres(iD: varID, name:varName)
                    self.genres.append(genre)
                }
                completionHandler(self.genres)
            }
        }        //TODO utilizar completion handler
    }
    
    
    func getPopulars(completionHandler:@escaping ([Movie]?) -> Void){
        Alamofire.request(popularUrl).responseJSON { response in
            if let popularJSON = response.result.value{
                let movieJSON:Dictionary = popularJSON as! [String:Any]
                let resultMovies = movieJSON["results"] as! [[String:Any]]
                for movie in resultMovies{
                    let poster_path = movie["poster_path"] as! String
                    let overview = movie["overview"] as! String
                    let genre_ids = movie["genre_ids"] as! [Int]
                    let id = movie["id"] as! Int
                    let original_title = movie["original_title"] as! String
                    
                    let movieJ = Movie(poster_path: poster_path, overview: overview, genre_ids: genre_ids, id: id, original_title: original_title)
                    self.movies.append(movieJ)
                }
                completionHandler(self.movies)
            }
        }
    }
    
    func getTopRated(completionHandler:@escaping(([Movie]?) -> Void)){
        Alamofire.request(topRatedUrl).responseJSON { response in
            if let topRatedJSON = response.result.value{
                let movieJSON: Dictionary = topRatedJSON as! [String:Any]
                let resultMovies = movieJSON["results"] as! [[String:Any]]
                for movie in resultMovies{
                    let poster_path = movie["poster_path"] as! String
                    let overview = movie["overview"] as! String
                    let genre_ids = movie["genre_ids"] as! [Int]
                    let id = movie["id"] as! Int
                    let original_title = movie["original_title"] as! String
                    
                    let movieJ = Movie(poster_path: poster_path, overview: overview, genre_ids: genre_ids, id: id, original_title: original_title)
                    self.movies.append(movieJ)
                }
                completionHandler(self.movies)
            }
        }
    }
}


