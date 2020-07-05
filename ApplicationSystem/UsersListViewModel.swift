//
//  UsersListViewModel.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/05.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

struct userlist {
    var id: String
    var firstname : String
    var lastname : String
    var sex : NSNumber
    //所属組織
    var belongTeam :String
    //陸連
    var belongPrefecture :String
    //登録番号
    var registrationnumber :NSNumber
    //代表者名
    var representativeName : String
    //住所
    var address : String
    //電話番号
    var phonenumber : NSNumber
    //メールアドレス
    var mails : String

}



class UsersListViewModel: ObservableObject {
@Published var userdatas = [userlist]()
@Published var noData = false
    
init() {
    let db = Firestore.firestore()

    db.collection("userlist").addSnapshotListener { (snap, err) in
        if err != nil {
            print((err?.localizedDescription)!)
            self.noData = true
            return
        }
        
        if (snap?.documentChanges.isEmpty)!{
            
            self.noData = true
            return
        }
        
        for i in snap!.documentChanges {
            
                    let id = i.document.documentID
                    let fiestname = i.document.get("fiestname") as! String
                    let lastname = i.document.get("lastname") as! String
                    let sex = i.document.get("sex") as! NSNumber
                    let belongTeam = i.document.get("belongTeam") as! String
                    let belongPrefecture = i.document.get("belongPrefecture") as! String
                    let registrationnumber = i.document.get("registrationnumber") as! NSNumber
                    let representativeName = i.document.get("representativeName") as! String
                    let address = i.document.get("address") as! String
                    let phonenumber = i.document.get("phonenumber") as! NSNumber
                    let mails = i.document.get("mails") as! String
                    
                    self.userdatas.append(userlist(id: id, firstname: fiestname, lastname: lastname, sex: sex, belongTeam: belongTeam, belongPrefecture: belongPrefecture, registrationnumber: registrationnumber, representativeName: representativeName, address: address, phonenumber: phonenumber, mails: mails))
                    
                }
            }
        }
    




func addUser(firstname: String, lastname: String, sex: NSNumber, belongTeam: String, belongPrefecture: String, registrationnumber: NSNumber, representativeName: String, address: String, phonenumber: NSNumber, mails: String) {
        let data : [String:Any] = [
            "firstname": firstname,
            "lastname": lastname,
            "sex": sex,
            "belongTeam": belongTeam,
            "belongPrefecture": belongPrefecture,
            "registrationnumber": registrationnumber,
            "representativeName": representativeName,
            "address": address,
            "phonenumber": phonenumber,
            "mails": mails
        ]

    let db  = Firestore.firestore()

        db.collection("userlist").addDocument(data: data) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            print("success")
        }
    }
}

