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

struct userlist {
    var id: String
    var firstname : String
    var lastname : String
    var sex : NumberFormatter
    //所属組織
    var belongTeam :String
    //陸連
    var belongPrefecture :String
    //登録番号
    var registrationnumber :NumberFormatter
    //代表者名
    var representativeName : String
    //住所
    var address : String
    //電話番号
    var phonenumber : NumberFormatter
    //メールアドレス
    var mails : String

}

class UsersListViewModel: ObservableObject {
@Published var datas = [userlist]()
init() {
    let db = Firestore.firestore()

    db.collection("userlist").addSnapshotListener { (snap, err) in
        if err != nil {
            print((err?.localizedDescription)!)
            return
        }
        for i in snap!.documentChanges {

            let id = i.document.documentID
            let fiestname = i.document.get("fiestname") as! String
            let lastname = i.document.get("lastname") as! String
            let sex = i.document.get("sex") as! NumberFormatter
            let belongTeam = i.document.get("belongTeam") as! String
            let belongPrefecture = i.document.get("belongPrefecture") as! String
            let registrationnumber = i.document.get("registrationnumber") as! NumberFormatter
            let representativeName = i.document.get("representativeName") as! String
            let address = i.document.get("address") as! String
            let phonenumber = i.document.get("phonenumber") as! NumberFormatter
            let mails = i.document.get("mails") as! String
            
            self.datas.append(userlist(id: id, firstname: fiestname, lastname: lastname, sex: sex, belongTeam: belongTeam, belongPrefecture: belongPrefecture, registrationnumber: registrationnumber, representativeName: representativeName, address: address, phonenumber: phonenumber, mails: mails))
            }
        }
    
    }
}




