//
//  ServiceManager.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/16/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import Alamofire

final class MovieFacade {
    
    static let shared = MovieFacade()
    
    private let genresUrl = "https://api.themoviedb.org/3/genre/movie/list?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US"
    
    private let popularUrl = "https://api.themoviedb.org/3/movie/popular?api_key=1f4d7de5836b788bdfd897c3e0d0a24b"
    
    private let topRatedUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b"
    
    func getGenres(completionHandler:@escaping ([Genres]?) -> Void){
        var genres = [Genres]()
        
        Alamofire.request(genresUrl).responseJSON { response in
            
            if let genreJSON = response.result.value{
                
                let movieJSON:Dictionary = genreJSON as! [String:Any]
                let movieGenre = movieJSON["genres"] as! [[String:Any]]
                var varID:Int
                var varName:String
                for i in 0..<movieGenre.count{
                    varID = movieGenre[i]["id"] as! Int
                    varName = movieGenre[i]["name"] as! String
                    
                    let genre = Genres(iD: varID, name:varName)
                    genres.append(genre)
                }
                completionHandler(genres)
            }
        }
    }
    
    
    func getPopulars(completionHandler:@escaping ([Movie]) -> Void){
        var movieList = [Movie]()
        
        Alamofire.request(popularUrl).responseJSON { (response) in
            
            if let popularJSON = response.result.value{
                let movieJSON:Dictionary = popularJSON as! [String:Any]
                let resultMovies = movieJSON["results"] as! [[String:Any]]
                for movie in resultMovies{
                    let newMovie = Movie(json: movie)
                    movieList.append(newMovie)
                }
                completionHandler(movieList)
            }
        }
    }
    
    func getTopRated(completionHandler:@escaping(([Movie]) -> Void)){
        var movieList = [Movie]()
        
        Alamofire.request(topRatedUrl).responseJSON { (response) in
            
            if let testJSON = response.result.value {
                let dataJSON:Dictionary = testJSON as! [String: Any]
                let listJSON = dataJSON["results"] as! [[String:Any]]
                for movie in listJSON{
                    let newMovie = Movie(json: movie)
                    movieList.append(newMovie)
                }
                completionHandler(movieList)
            }
        }
    }
}


