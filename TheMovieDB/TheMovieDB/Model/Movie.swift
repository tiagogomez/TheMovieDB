//
//  TestMovie.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/17/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class Movie: NSObject {
    
    var poster_path: String?
    var backdrop_path: String?
    var overview: String?
    var genre_ids:[Int]?
    var id: Int?
    var original_title: String?
    //var image: UIImage?
    
    init(json: [String: Any]) {
        let imageUrl = json["poster_path"] as? String
        let backdropUrl = json["backdrop_path"] as? String
        if backdropUrl == nil {
            self.backdrop_path = "https://image.tmdb.org/t/p/w300/kqjL17yufvn9OVLyXYpvtyrFfak.jpg"

        }else{
            self.backdrop_path = "https://image.tmdb.org/t/p/w300" + backdropUrl!
        }
        self.poster_path = "https://image.tmdb.org/t/p/w300" + imageUrl!
        self.overview = json["overview"] as? String
        self.genre_ids = json["genre_ids"] as? [Int]
        self.id = json["id"] as? Int
        self.original_title = json["original_title"] as? String
    }
}

enum MovieListType{
    case nowPlaying
    case topRated
    case popular
    case upcomming
}
