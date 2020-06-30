//
//  GameList.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/06/29.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import CoreData

public class GameList:NSManagedObject, Identifiable{
    @NSManaged public var gamedate:Data?
    @NSManaged public var gamename:String?
    @NSManaged public var place:String?
}

extension GameList{
    static func getAllGameList() -> NSFetchRequest<GameList>{
        let request:NSFetchRequest<GameList> = GameList.fetchRequest() as!
        NSFetchRequest<GameList>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
