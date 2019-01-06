//
//  MyFavoritesCollectionEx.swift
//  MoviesApp
//
//  Created by a7med on 1/5/19.
//  Copyright © 2019 a7med. All rights reserved.
//

import UIKit

extension MyFavoritesVC: UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let mt = dataSource[indexPath.row].title
        let img = URLs.imageUrl + (dataSource[indexPath.row].image ?? "")
        cell.delegate = self
        cell.configureCell(MovieTitle: mt! , MovieImage: img)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width / 2) - 16
        let height = (collectionView.frame.height / 3) - 16
        
        return CGSize(width: width, height: height)
    }
}
