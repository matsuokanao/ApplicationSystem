//
//  DiaryViewModel.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/02.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore


struct Diary: Identifiable {
    var id: String
    var diarycontent :String
    
    
}

class DiaryViewModel: ObservableObject {
    @Published var datas = [Diary]()
    @Published var noDate = false

    init() {
        let db = Firestore.firestore()

        db.collection("diary").addSnapshotListener { (snap, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                self.noDate = true
                return
            }
            if (snap?.documentChanges.isEmpty)!{
                self.noDate = true
            }
            for i in snap!.documentChanges {

                let id = i.document.documentID
                let diarycontent = i.document.get("diarycontent") as! String
            
                self.datas.append(Diary(id: id, diarycontent: diarycontent))
            }
        }
    }
}



func addDiary(diarycount: String) {
        let data = [
            "diarycount": diarycount
    ]

        let db = Firestore.firestore()

        db.collection("diary").addDocument(data: data) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            print("success")
        }
    }


