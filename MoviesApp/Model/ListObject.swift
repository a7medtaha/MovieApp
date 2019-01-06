//
//  MenuObject.swift
//  Wuzfone
//
//  Created by apple on 10/18/18.
//  Copyright © 2018 grand. All rights reserved.
//

import Foundation
class ListObject{
    var id : Int = 0
    var image : String?
    var title : String?
    
    init(id : Int,title: String ,image: String) {
        self.id = id
        self.image = image
        self.title = title
        
    }
}
