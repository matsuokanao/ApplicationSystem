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
@Published var completedata = [completelist]()
         init() {
             
             let db = Firestore.firestore()
             
             db.collection("complete").order(by: "date", descending: false).addSnapshotListener { (snap, err) in
                 
                 if err != nil{
                     print((err?.localizedDescription)!)
                     return
                 }
                 
                 if (snap?.documentChanges.isEmpty)!{
                     return
                 }
                 
        for i in snap!.documentChanges{
            if i.type == .added{
                         
            let id = i.document.documentID
                         
            let completegamename = i.document.get("completegamename") as! String
                let completegamevenue = i.document.get("completegamevenue") as! String
                let completeplace = i.document.get("completeplace") as! String
                let event1 = i.document.get("event1") as! String
                let event2 = i.document.get("event2") as! String
                let event3 = i.document.get("event3") as! String
            self.completedata.append(complete(id: id, completegamename: completegamename, completegamevenue: completegamevenue, completeplace: completeplace, event1: event1, event2: event2, event3: event3))
                     }
                 }
             }
         }
     }

    

struct completelist: Identifiable {
var id: String
var completegamename: String
var completegamevenue: String
var completeplace: String
var event1: String
var event2: String
var event3: String
}


