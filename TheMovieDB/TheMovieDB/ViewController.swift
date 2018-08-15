//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request("https://api.themoviedb.org/3/genre/movie/list?api_key=1f4d7de5836b788bdfd897c3e0d0a24b&language=en-US").responseJSON { response in
           /* print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")           */              // response serialization result
            
            if let json = response.result.value {
               // print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                //print("Data: \(utf8Text)") // original server data as UTF8 string
            }
            
            if let genreJSON = response.result.value{
                let movieJSON:Dictionary = genreJSON as! Dictionary<String, Any>
                let movieGenre = movieJSON["genres"] as! Array<Dictionary<String, Any>>
                var iD:Int
                var name:String
                for i in 0..<movieGenre.count{
                    iD = movieGenre[i]["id"] as! Int
                    print(iD)
                    name = movieGenre[i]["name"] as! String
                    print(name)
                }
                
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

