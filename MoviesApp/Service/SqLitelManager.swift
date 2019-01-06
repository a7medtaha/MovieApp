//
//  SqLitelManager.swift
//  MoviesApp
// 
//  Created by a7med on 1/6/19.
//  Copyright © 2019 a7med. All rights reserved.
//    Persisting  favorites data.


import UIKit
import SQLite
class SqlLiteManager {
    var database: Connection!
    
    let favTable = Table("fav")
    let id = Expression<Int>("id")
    let name = Expression<String>("name")
    let img = Expression<String>("img")
    static let shared = SqlLiteManager()
    func createFileAndConnection() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("fav").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
        } catch {
            print(error)
        }
    }
    func createTable()  {
        print("CREATE TAPPED")
        
        let createTable = self.favTable.create { (table) in
            table.column(self.id, unique: true)
            table.column(self.name)
            table.column(self.img)
        }
        
        do {
            try self.database.run(createTable)
            print("Created Table")
        } catch {
            print(error)
        }
    }
    func insertItem(_ id: Int,_ name: String,_ img: String) -> Bool  {
        let insertItem = self.favTable.insert(self.id <- id,self.name <- name, self.img <- img)
        
        do {
            try self.database.run(insertItem)
          
            print("INSERTED item")
             return true
        } catch {
            print(error)
            return false
        }

    }
    func listitems() -> [ListObject] {
        print("LIST TAPPED")
       var list = [ListObject]()
        do {
            let favs = try self.database.prepare(self.favTable)
            for fav in favs {
                print("Id: \(fav[self.id]), name: \(fav[self.name]), img: \(fav[self.img])")
                list.append(ListObject(id: fav[self.id], title: fav[self.name], image: fav[self.img]))
            }
            return list
            
        } catch {
            print(error)
            return []
        }
    }
    
    func deleteitem(_ id : Int) {
       
            
            let item = self.favTable.filter(self.id == id)
            let deleteitem = item.delete()
            do {
                try self.database.run(deleteitem)
            } catch {
                print(error)
            }
        }
    func updateitem(_ id : Int,_ img: String) {
       
            let item = self.favTable.filter(self.id == id)
            let updateitem = item.update(self.img <- img)
            do {
                try self.database.run(updateitem)
            } catch {
                print(error)
            }
        }
    

}
