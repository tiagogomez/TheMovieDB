//
//  Genres.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class Genres: NSObject {
    
    var iD: Int?
    var name: String?
    
    init(iD:Int, name:String) {
        self.iD = iD
        self.name = name
    }
}
