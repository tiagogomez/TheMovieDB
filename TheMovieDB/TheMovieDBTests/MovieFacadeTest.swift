//
//  MovieFacadeTest.swift
//  TheMovieDBTests
//
//  Created by Santiago Gomez Giraldo on 9/5/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
import OHHTTPStubs

@testable import TheMovieDB

class MovieFacadeTest: XCTestCase {
    
    let movieFacade = MovieFacade()
    var mockMovieJson: [String: Any]?
    var mockMovie: Movie?
    var mockGenres: Genres?
    
    override func setUp() {
        super.setUp()
        mockMovieJson = [
            "vote_count": 7613,
            "id": 299536,
            "video": false,
            "vote_average": 8.3,
            "title": "Avengers: Infinity War",
            "popularity": 228.27,
            "poster_path": "/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg",
            "original_language": "en",
            "original_title": "Avengers: Infinity War",
            "genre_ids": [
                12,
                878,
                14,
                28
            ],
            "backdrop_path": "/bOGkgRGdhrBYJSLpXaxhXVstddV.jpg",
            "adult": false,
            "overview": "As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.",
            "release_date": "2018-04-25"
        ]
        
        mockMovie = Movie(json: mockMovieJson!)
        mockGenres = Genres (iD: 11, name: "Mygenre")
    }
    
    override func tearDown() {
        mockMovieJson = nil
        mockMovie = nil
        super.tearDown()
    }
    
    func testGetMovieList(){
        var myMovie: Movie?
        let waiting = expectation(description: "Esperando Servicio")
        movieFacade.getMoviesList(listType: .popular, numberOfPage: 1) { (movies) in
            myMovie = movies[0]
            waiting.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertEqual(myMovie?.overview, mockMovie?.overview)
    }
    
    func testGetGenres(){
        let myGenreJson: [String : Any] = [
                "genres": [
                    [
                        "id": 15,
                        "name": "Mygenre"
                    ],
                    [
                        "id": 12,
                        "name": "Adventure"
                    ]
                ]
            ]
        stub(condition: isAbsoluteURLString("https://api.themoviedb.org/3/genre/movie/list?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US")) { _ in
            return OHHTTPStubsResponse(jsonObject: myGenreJson,
                                       statusCode: 200,
                                       headers: nil)
        }
        var myGenres: Genres?
        let waiting = expectation(description: "Esperando Servicio")
        movieFacade.getGenres { (genres) in
            myGenres = genres[0]
            waiting.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertEqual(myGenres?.iD, mockGenres?.iD)
    }
    
    
}
