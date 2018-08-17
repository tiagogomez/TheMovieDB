//
//  Movie.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/16/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class Movie: NSObject {
    
    var poster_path: String?
    var overview: String?
    var genre_ids:[Int]?
    var id: Int?
    var original_title: String?
    
    init(poster_path:String, overview:String, genre_ids:[Int], id:Int, original_title:String) {
        self.poster_path = poster_path
        self.overview = overview
        self.genre_ids = genre_ids
        self.id = id
        self.original_title = original_title
    }

}
