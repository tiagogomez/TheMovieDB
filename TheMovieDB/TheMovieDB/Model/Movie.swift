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
    var overview: String?
    var genre_ids:[Int]?
    var id: Int?
    var original_title: String?
    
    init(json: [String: Any]) {
        self.poster_path = json["poster_path"] as? String
        self.overview = json["overview"] as? String
        self.genre_ids = json["genre_ids"] as? [Int]
        self.id = json["id"] as? Int
        self.original_title = json["original_title"] as? String
    }
}
