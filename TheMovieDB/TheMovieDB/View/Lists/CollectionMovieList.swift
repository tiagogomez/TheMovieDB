//
//  CollectionMovieList.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/27/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class CollectionMovieList: UICollectionView, List {
    var listDelegate: MoviesListDelegate?
   
    init(/*layout: UICollectionViewLayout*/) {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left:10, bottom:10, right:10)
        layout.itemSize = CGSize(width:154, height:286)
        super.init(frame: CGRect.zero, collectionViewLayout: layout)
        self.backgroundColor? = UIColor.white
        self.dataSource = self
        self.delegate = self
        self.register(UINib(nibName: "MyCollectionCell", bundle: .main), forCellWithReuseIdentifier: "MyCollectionCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionMovieList: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (listDelegate?.numberOfItems())!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "MyCollectionCell", for: indexPath) as! ListCell
        listDelegate?.configureCell(cell: cell, atIndexPath: indexPath)
        return cell as! UICollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        listDelegate?.willDisplayCell(atIndexPath: indexPath)
    }
}

extension CollectionMovieList: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        listDelegate?.didSelectCell(atIndexPath: indexPath)
    }
}
