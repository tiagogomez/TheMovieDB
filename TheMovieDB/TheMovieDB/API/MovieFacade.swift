//
//  ServiceManager.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/16/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

final class MovieFacade {
        
    private let genresUrl = "https://api.themoviedb.org/3/genre/movie/list?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US"
    
    //private let popularUrl = "https://api.themoviedb.org/3/movie/popular?api_key=1f4d7de5836b788bdfd897c3e0d0a24b"
    
    //private let topRatedUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b"
    
    
    func getGenres(completionHandler:@escaping ([Genres]) -> Void){
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
    
    
    func getMoviesList(listType: MovieListType, numberOfPage: Int, completionHandler:@escaping ([Movie]) -> Void){
        var movieList = [Movie]()
        var url:String?
        switch listType {
        case .popular:
            url =/*popularUrl*/"https://api.themoviedb.org/3/movie/popular?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&page=\(numberOfPage)"
        case .topRated:
            url =/*topRatedUrl*/"https://api.themoviedb.org/3/movie/top_rated?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&page=\(numberOfPage)"
        default:
            url="https://api.themoviedb.org/3/movie/popular?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&page=\(numberOfPage)"
        }
        Alamofire.request(url!).responseJSON { (response) in
            
            if let popularJSON = response.result.value{
                let movieJSON:Dictionary = popularJSON as! [String:Any]
                let resultMovies = movieJSON["results"] as! [[String:Any]]
                /*movieList = resultMovies.map({
                    return Movie(json: $0)
                    
                })*/
                //movieList = resultMovies.map(Movie.init(json: ))
                for movie in resultMovies{
                    let newMovie = Movie(json: movie)
                    movieList.append(newMovie)
                }
                completionHandler(movieList)
            }
        }
    }
    
    /*func getMovieImage(image_path: String, completionHandler:@escaping (Image) -> Void){
        Alamofire.request("https://image.tmdb.org/t/p/w154/"+image_path).responseImage { response in
            if let image = response.result.value {
                //print("image downloaded: \(image)")
                completionHandler(image)
            }
        }
    }*/
}


