//
//  TableMovieList.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/24/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class TableMovieList: UITableView, List {
    var listDelegate: MoviesListDelegate?
    
    init() {
        super.init(frame: CGRect.zero, style: .plain)
        self.dataSource = self
        self.delegate = self
        self.register(UINib(nibName: "MyTableCell", bundle: nil), forCellReuseIdentifier: "MyTableCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*override func numberOfRows(inSection section: Int) -> Int {
        return (listDelegate?.numberOfItems())!
    }
    
    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        let cell = dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListCell
        listDelegate?.configureCell(cell: cell, atIndexPath: indexPath)
        return cell as! UITableViewCell
    }*/
}

extension TableMovieList: UITableViewDataSource{
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (listDelegate?.numberOfItems())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "MyTableCell", for: indexPath) as! ListCell
        listDelegate?.configureCell(cell: cell, atIndexPath: indexPath)
        return cell as! UITableViewCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        listDelegate?.willDisplayCell(atIndexPath: indexPath)
    }
}

extension TableMovieList: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listDelegate?.didSelectCell(atIndexPath: indexPath)
    }
}
