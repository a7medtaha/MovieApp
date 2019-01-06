//
//  MyFavoritesVC.swift
//  MoviesApp
//
//  Created by a7med on 1/5/19.
//  Copyright © 2019 a7med. All rights reserved.
//

import UIKit

class MyFavoritesVC: UIViewController {
    var dataSource = [ListObject]()

    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

        // Do any additional setup after loading the view.
    }
    func deleteitem(_ cell: HomeCell)  {
        print("deletefavcell")
        if  let indexPath = collection.indexPath(for: cell){
        let item_id = dataSource[indexPath.item].id
        SqlLiteManager.shared.deleteitem(item_id)
        dataSource.remove(at: indexPath.item)
        collection.deleteItems(at: [indexPath])
        }
       
    }

   

}
