//
//  HomeVC.swift
//  MoviesApp
//
//  Created by a7med on 1/4/19.
//  Copyright © 2019 a7med. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    var dataSource : Home_Base?
 
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(" date ==> ",APIManager.sharedInstance.returnDate())
GetLatestMovies()
        
        // Do any additional setup after loading the view.
    }
    
    func GetLatestMovies() {
       
            APIManager.sharedInstance.getRequest("\(URLs.discover)&primary_release_date.lte=\(APIManager.sharedInstance.returnDate())") { (res) in
                if res.error != nil{
                    print(res.error?.localizedDescription)
                }else{
                    let decoder = JSONDecoder()
                    do{
                        let model = try decoder.decode(Home_Base.self, from: res.data!)
                        self.dataSource = model
                        print("session ID Model ==>>",model)
                        
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
        
    }
    
    
}
