//
//  Diart.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/02.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase


enum DiaryPriority {
  case high
  case medium
  case low
}

struct Diary: Identifiable {
  var id: String = UUID().uuidString
  var title: String
  var priority: DiaryPriority
  var completed: Bool
}

#if DEBUG
let testDataDiarys = [
  Diary(title: "Implement UI", priority: .medium, completed: false),
  Diary(title: "Connect to Firebase", priority: .medium, completed: false),
  Diary(title: "????", priority: .high, completed: false),
  Diary(title: "PROFIT!!!", priority: .high, completed: false)
]
#endif


