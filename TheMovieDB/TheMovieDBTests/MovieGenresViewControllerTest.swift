//
//  MovieGenresViewControllerTest.swift
//  TheMovieDBTests
//
//  Created by Santiago Gomez Giraldo on 9/5/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
import UIKit
@testable import TheMovieDB

class MovieGenresViewControllerTest: XCTestCase {
    
    var viewController: GenresTableViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let identifier = String(describing: GenresTableViewController.self)
        
        viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! GenresTableViewController
        _ = viewController.view
    }
    
    func testGenreListViewDidLoad() {
        XCTAssertTrue(viewController != nil, "The view should be set")
    }

    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
}
