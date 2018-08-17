//
//  MovieFacade.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/16/18.
//  Copyright © 2018 Globant. All rights reserved.
//

final class MovieFacade {
    
    static let shared = MovieFacade()
    private let serviceManager = ServiceManager()
    
    private init() {
        
    }
    
    func getGenres() {
        serviceManager.getGenres { genres in
            print(genres!)
        }
    }
    
    func getPopulars() {
        serviceManager.getPopulars { movie in
            print(movie!)
        }
    }
    
    func getTopRated() {
        serviceManager.getTopRated { movie in
            print(movie!)
        }
    }
}
