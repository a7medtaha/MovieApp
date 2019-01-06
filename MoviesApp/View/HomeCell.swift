//
//  HomeCell.swift
//  MoviesApp
//
//  Created by a7med on 1/4/19.
//  Copyright © 2019 a7med. All rights reserved.
//

import UIKit
import SDWebImage

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    func configureCell(MovieTitle title: String ,MovieImage img: String )  {
        DispatchQueue.main.async {
            self.movieImage.sd_setImage(with: URL(string: img), completed: nil)
            
        }
        
    }
    @IBAction func likeBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func ShareBtnPressed(_ sender: UIButton) {
    }
}
