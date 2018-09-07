//
//  MovieMainViewControllerTest.swift
//  TheMovieDBTests
//
//  Created by Santiago Gomez Giraldo on 9/5/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
import UIKit
@testable import TheMovieDB

class MovieMainViewControllerTest: XCTestCase {
    
    var viewController: MainViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let identifier = String(describing: MainViewController.self)
        
        viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! MainViewController
        _ = viewController.view
    }
    
    func testMovieListViewDidLoad() {
        XCTAssertTrue(viewController.list != nil, "The view should be set")
    }
    
    func testSetMovieListDelegate() {
        XCTAssertTrue(viewController.list.listDelegate != nil, "The list delegate should be set")
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
}

