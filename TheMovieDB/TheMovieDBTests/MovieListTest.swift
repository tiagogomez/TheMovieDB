//
//  MovieListTest.swift
//  TheMovieDBTests
//
//  Created by Santiago Gomez Giraldo on 9/6/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
@testable import TheMovieDB

struct MockMovie {
    var mockTitle: String
    var mockImage: String
}

class MockMoviesListDelegate: MoviesListDelegate{
    var mockMovies = [MockMovie]()
    
    func numberOfItems() -> Int {
        return mockMovies.count
    }
    
    func configureCell(cell: ListCell, atIndexPath: IndexPath) {
        let mock = mockMovies[atIndexPath.row]
        cell.title.text = mock.mockTitle
    }
    
    func didSelectCell(atIndexPath: IndexPath) {
        //Nothing to do here
    }
    
    func willDisplayCell(atIndexPath: IndexPath) {
        //Nothing to do here
    }
    
    
}

class MovieListTest: XCTestCase {
    
    var testCollectionMovieList: List?
    var testTableMovieList: List?
    let listDelegate = MockMoviesListDelegate()
    
    override func setUp() {
        super.setUp()
        let collectionView = CollectionMovieList()
        collectionView.listDelegate = listDelegate
        collectionView.reloadData()
        testCollectionMovieList = collectionView
        let tableView = TableMovieList()
        tableView.listDelegate = listDelegate
        tableView.reloadData()
        testTableMovieList = tableView
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testConfigureCollectionCell() {
        let mockMovie = MockMovie(mockTitle: "My Movie",
                                  mockImage: "My Image")
        listDelegate.mockMovies.append(mockMovie)
        testCollectionMovieList?.reloadData()
        if let collectionView = testCollectionMovieList as?  CollectionMovieList{
            if collectionView.visibleCells.count == 0 {
                let cell = collectionView.collectionView(collectionView, cellForItemAt: IndexPath(item: 0, section: 0 )) as! ListCell
                XCTAssertTrue(cell.title.text == mockMovie.mockTitle)
            }
        }
    }
    
    func testConfigureTableCell() {
        let mockMovie = MockMovie(mockTitle: "My Movie",
                                  mockImage: "My Image")
        listDelegate.mockMovies.append(mockMovie)
        testTableMovieList?.reloadData()
        if let tableView = testTableMovieList as?  TableMovieList{
            let cell = tableView.tableView(tableView, cellForRowAt: IndexPath(item: 0, section: 0)) as! ListCell
            XCTAssertTrue(cell.title.text == mockMovie.mockTitle)
        }
    }
    
}
