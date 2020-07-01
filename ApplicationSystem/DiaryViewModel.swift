//
//  DiaryViewModel.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/01.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class getDiary : ObservableObject{
    @Published var date = [Diary]()
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
                        return
                    }
                    
                    for i in snap!.documentChanges {
                        
                        if i.type == .added{

                        let id = i.document.documentID
                        let date = i.document.get("date") as! String
                        let diary = i.document.get("diary") as! String
                        
                        self.date.append(Diary(id: id, date: date, diary: diary))
                }
                        
                    if i.type == .modified {
                            
                }
                        if i.type == .removed{
                            
                        }
            }
        }
    }
}
struct  Diary : Identifiable {
    var id: String
    var date : String
    var diary : String
    
}



