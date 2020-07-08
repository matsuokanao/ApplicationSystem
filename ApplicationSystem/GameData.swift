//
//  getData.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/07.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import FirebaseFirestore


struct gamelist: Identifiable {
var id: String
var gamename: String
var gamevenue: String
var place: String
var png: String
}

//読み込み
class getGameData : ObservableObject{
    @Published var datas = [gamelist]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("gamelist").getDocuments{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documents{
                
                let id = i.documentID
                let gamename = i.get("gamename") as! String
                let gamevenue = i.get("gamevenue") as! String
                let place = i.get("place") as! String
                let png = i.get("png") as! String
                
                self.datas.append(gamelist(id: id, gamename: gamename, gamevenue: gamevenue, place: place, png: png))
            }
        }
    }
}



