//
//  MyFavoritesDataEx.swift
//  MoviesApp
//
//  Created by a7med on 1/5/19.
//  Copyright © 2019 a7med. All rights reserved.
//

import UIKit

extension MyFavoritesVC{
    func getData()  {
      dataSource = SqlLiteManager.shared.listitems()
        collection.reloadData()
    }
}
