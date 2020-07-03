//
//  DiaryRepository.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/02.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation

class BaseDiaryRepository {
  @Published var Diarys = [Diary]()
}

protocol DiaryRepository: BaseDiaryRepository {
  func addDiary(_ diary: Diary)
  func removeDiary(_ diary: Diary)
  func updateDiary(_ diary: Diary)
}

class TestDataDiaryRepository: BaseDiaryRepository, DiaryRepository, ObservableObject {
  override init() {
    super.init()
    self.Diarys = testDataDiarys
  }
  
  func addDiary(_ diary: Diary) {
    Diarys.append(diary)
  }
  
  func removeDiary(_ diary: Diary) {
    if let index = Diarys.firstIndex(where: { $0.id == diary.id }) {
      Diarys.remove(at: index)
    }
  }
  
  func updateDiary(_ diary: Diary) {
    if let index = self.Diarys.firstIndex(where: { $0.id == diary.id } ) {
      self.Diarys[index] = diary
    }
  }
}
