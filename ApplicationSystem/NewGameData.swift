//
//  ApplicationViewModel.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/06.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore


class ApplicationViewModel: ObservableObject {
    
    var db = Firestore.firestore()
    //データの書き込み
    func addGame( gamename: String , gamevenue: String,place: String,png: String,date: String, link: String, sponsor :String, gamepass:String,email: String) {
        let data = [
            "gamename": gamename,
            "gamevenue": gamevenue,
            "place": place,
            "png": png,
            "date": date,
            "link" :link,
            "sponsor": sponsor,
            "gamepass": gamepass,
            "email": email
            
            ]
        db.collection("gamelist").addDocument(data: data).setData(data) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            print("success")
        }
    }
}
