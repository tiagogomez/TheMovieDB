//
//  MovieFacadeTest.swift
//  TheMovieDBTests
//
//  Created by Santiago Gomez Giraldo on 9/5/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
@testable import TheMovieDB

class MovieClassTest: XCTestCase {
    
    var mockMovieJson: [String: Any]?
    let mockPoster_path = "https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg"
    let backdrop_path = "/bOGkgRGdhrBYJSLpXaxhXVstddV.jpg"
    let overview = "As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain."
    let genre_ids = [12, 878,14,28]
    let id = 299536
    let original_title = "Avengers: Infinity War"
    let vote_average = 8.3
    let release_date = "2018-04-25"
    
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
    }
    
    override func tearDown() {
        mockMovieJson = nil
        super.tearDown()
    }
    
    func testMovieInitializerId() {
        var movie: Movie?
        movie = Movie(json: mockMovieJson!)
        XCTAssertEqual(movie?.id, id)
    }
    
    func testMovieInitializerOriginal_title() {
        var movie: Movie?
        movie = Movie(json: mockMovieJson!)
        XCTAssertEqual(movie?.original_title, original_title)
    }
    
    func testMovieInitializerPoster_path() {
        var movie: Movie?
        movie = Movie(json: mockMovieJson!)
        XCTAssertEqual(movie?.poster_path, mockPoster_path)
    }
    
    func testMovieInitializerOverview() {
        var movie: Movie?
        movie = Movie(json: mockMovieJson!)
        XCTAssertEqual(movie?.overview, overview)
    }
    
    func testMovieInitializerGenres() {
        var movie: Movie?
        movie = Movie(json: mockMovieJson!)
        XCTAssertEqual((movie?.genre_ids)!, genre_ids)
    }
}
