//
//  InformationData.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/08.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import FirebaseFirestore


struct complete {
    var id : String
    var name: String
    var completegamename : String
    var completegamevenue : String
    var completeplace : String
    var event1 : String
    var event2 : String
    var event3 : String
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
    var idEmail : String
    //パスワード
    var pass : String
    //大会日程
    var  gamedate :String
    //要項
    var  png :String
    
}

//読み込み
class getCompleteData : ObservableObject{
    @Published var datas = [complete]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("complete").getDocuments{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documents{
                let id = i.documentID
                let name = i.get("name") as! String
                let completegamename = i.get("completegamename") as! String
                let completegamevenue = i.get("completegamevenue") as! String
                let completeplace = i.get("completeplace") as! String
                let event1 = i.get("event1") as! String
                let event2 = i.get("event2") as! String
                let event3 = i.get("event3") as! String
                let sex = i.get("sex") as! String
                let belongTeam = i.get("belongTeam") as! String
                let belongPrefecture = i.get("belongPrefecture") as! String
                let registrationnumber = i.get("registrationnumber") as! String
                let representativeName = i.get("representativeName") as! String
                let address = i.get("address") as! String
                let phonenumber = i.get("phonenumber") as! String
                let idEmail = i.get("idEmail") as! String
                let pass = i.get("pass") as! String
                let gamedate = i.get("gamedate") as! String
                let png = i.get("png") as! String
                
                self.datas.append(complete(id: id,name: name, completegamename: completegamename, completegamevenue: completegamevenue, completeplace: completeplace, event1: event1, event2: event2, event3: event3, sex: sex, belongTeam: belongTeam, belongPrefecture: belongPrefecture, registrationnumber: registrationnumber, representativeName: representativeName, address: address, phonenumber: phonenumber, idEmail: idEmail, pass:pass, gamedate: gamedate, png: png))
            }
        }
    }
}
