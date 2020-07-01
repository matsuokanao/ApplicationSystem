//
//  ApplicationViewModel.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/01.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore


class ApplicationViewModel: ObservableObject {
    @Published var datas = [gamelist]()

    init() {
        let db = Firestore.firestore()

        db.collection("gamelist").addSnapshotListener { (snap, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documentChanges {

                let id = i.document.documentID
                let gamename = i.document.get("gamename") as! String
                let gamevenue = i.document.get("gamevenue") as! String
                let place = i.document.get("place") as! String
                let png = i.document.get("png") as! String

                self.datas.append(gamelist(id: id, gamename: gamename, gamevenue: gamevenue, place: place,png: png))
            }
        }
    }
}


struct gamelist: Identifiable {
    var id: String
    var gamename: String
    var gamevenue: String
    var place: String
    var png: String
    
}



