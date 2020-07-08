//
//  CompleteGameData.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/07.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import FirebaseFirestore


class CompleteViewModel: ObservableObject {
    
    var db = Firestore.firestore()
    //データの書き込み
    func addCompleteGame( gamename: String , gamevenue: String,place: String,png: String) {
        let data:[String:Any] = [
            "gamename": gamename,
            "gamevenue": gamevenue,
            "place": place,
            "png": png,
            ]
        db.collection("completegame").addDocument(data: data) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            print("success")
        }
    }
}
