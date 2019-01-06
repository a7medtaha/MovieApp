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

