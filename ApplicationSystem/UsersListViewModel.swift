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

    var db = Firestore.firestore()
        //データの書き込み
    func addUser(firstname:String, lastname:String, sex:String, belongTeam:String, belongPrefecture:String, registrationnumber:String, representativeName:String, address:String,phonenumber:String, email:String) {
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
            "email": email
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

        


   
        







    

