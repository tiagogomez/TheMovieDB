//
//  DetailViewController.swift
//  TheMovieDB
//
//  Created by Santiago Gomez Giraldo on 8/27/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movie:Movie? = nil
    
    @IBOutlet weak var detailMovieImage: UIImageView!
    @IBOutlet weak var detailMovieOveview: UITextView!
    @IBOutlet weak var detailVoteAverage: UILabel!
    @IBOutlet weak var detailReleaseDate: UILabel!
    @IBOutlet weak var detailWholeStack: UIStackView!
    @IBOutlet weak var detailLabelStack: UIStackView!
    
    var fullItemWidth: CGFloat?
    var fullItemHeight: CGFloat?
    //var viewSize: CGSize?
    var marginSize:CGFloat = 10
    var spacingSize:CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //viewSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height)
        setInfo()
        setupLayout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setInfo(){
        self.detailMovieOveview.text = movie?.overview
        self.navigationItem.title = movie?.original_title
        let image_path = movie?.backdrop_path
        if let imageUrl = URL(string: image_path!) {
            self.detailMovieImage.af_setImage(withURL: imageUrl)
        }
        self.detailVoteAverage.text = String(describing: (movie?.vote_average)!)
        self.detailReleaseDate.text = movie?.release_date
    }
    
    func setupLayout(){
        if (traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular){
            print("-------------ihone portrait")
            setPhonePortraitLayout()
            
        }
        else if (traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .compact){
            print("-------------ihone landscape")
            setPhoneLandscapeLayout()
        }
    }
    
    func setPhonePortraitLayout(){
        fullItemWidth = (view.bounds.size.width) - (marginSize*2)
        fullItemHeight = (fullItemWidth!/1.77) + spacingSize + (detailVoteAverage.bounds.size.height)
        
        //detailMovieImage.contentMode = .scaleAspectFit
        
        detailWholeStack.translatesAutoresizingMaskIntoConstraints = false
        detailWholeStack.topAnchor.constraint(equalTo: view/*.safeAreaLayoutGuide*/.topAnchor, constant: 50).isActive = true
        detailWholeStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: marginSize).isActive = true
        //detailWholeStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        detailWholeStack.widthAnchor.constraint(equalToConstant: fullItemWidth!).isActive = true
        detailWholeStack.heightAnchor.constraint(equalToConstant: fullItemHeight!).isActive = true
        
        detailMovieOveview.textAlignment = .justified
        detailMovieOveview.isEditable = false
        detailMovieOveview.translatesAutoresizingMaskIntoConstraints = false
        detailMovieOveview.topAnchor.constraint(equalTo: detailWholeStack.bottomAnchor, constant: marginSize).isActive = true
        detailMovieOveview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: marginSize).isActive = true
        detailMovieOveview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -marginSize).isActive = true
        detailMovieOveview.heightAnchor.constraint(equalToConstant: 200).isActive = true
        detailWholeStack.axis = .vertical
        detailLabelStack.axis = .horizontal
        updateViewConstraints()
        setInfo()
    }
    
    func setPhoneLandscapeLayout(){
        detailWholeStack.axis = .horizontal
        detailLabelStack.axis = .vertical
        updateViewConstraints()
        setInfo()
    }
    
    /*override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if size.width >= size.height{
            setPhoneLandscapeLayout()
        }else{
            setPhonePortraitLayout()
        }
        print("Va a rotar")
    }*/
    
    override func viewDidLayoutSubviews() {
        let size = view.bounds.size
        if size.width >= size.height{
            setPhoneLandscapeLayout()
        }else{
            setPhonePortraitLayout()
        }
    }
}
