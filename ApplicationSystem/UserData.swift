//
//  UsersListViewModel.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/05.
//  Copyright © 2020 松岡奈央. All rights reserved.
//
import Foundation
import FirebaseFirestore
import Firebase

struct userlist {
    var id: String
    var firstname : String
    var lastname : String
    var sex : String
    //所属組織
    var belongTeam :String
    //陸連
    var belongPrefecture :String
    //登録番号
    var registrationnumber :String
    //代表者名
    var representativeName : String
    //住所
    var address : String
    //電話番号
    var phonenumber : String
    //メールアドレス
    var email : String
    //権限
    var authority :String

}



class UsersListViewModel: ObservableObject {

    var db = Firestore.firestore()
        //データの書き込み
    func addUser(firstname:String, lastname:String, sex:String, belongTeam:String, belongPrefecture:String, registrationnumber:String, representativeName:String, address:String,phonenumber:String, email:String, authority:String) {
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
            "email": email,
            "authority": authority
        ]
    db.collection("userlist").addDocument(data: data) { error in
        if let error = error {
            print(error.localizedDescription)
            return
            }
            print("success")
        }
    }
}

class getUserData : ObservableObject{
    @Published var userdatas = [userlist]()
    init() {
        let db = Firestore.firestore()
        db.collection("userlist").getDocuments { (snap, err) in
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documents{
                
                let id = i.documentID
                let firstname = i.get("firstname") as! String
                let lastname = i.get("lastname") as! String
                let sex = i.get("sex") as! String
                let belongTeam = i.get("belongTeam") as! String
                let belongPrefecture = i.get("belongPrefecture") as! String
                let registrationnumber = i.get("registrationnumber") as! String
                let representativeName = i.get("representativeName") as! String
                let address = i.get("address") as! String
                let phonenumber = i.get("phonenumber") as! String
                let email = i.get("email") as! String
                let authority = i.get("authority") as! String
                
                self.userdatas.append(userlist(id: id, firstname: firstname, lastname: lastname, sex: sex, belongTeam: belongTeam, belongPrefecture: belongPrefecture, registrationnumber: registrationnumber, representativeName: representativeName, address: address, phonenumber: phonenumber, email: email,authority:authority))
            }
        }
    }
}
