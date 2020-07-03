//
//  DiaryCellViewModel.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/02.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import Combine

class DiaryCellViewModel: ObservableObject, Identifiable  { // (6)
  @Published var diary: Diary
  
  var id: String = ""
  @Published var completionStateIconName = ""
  
  private var cancellables = Set<AnyCancellable>()
  
  static func newDiary() -> DiaryCellViewModel {
    DiaryCellViewModel(diary: Diary(title: "", priority: .medium, completed: false))
  }
  
  init(diary: Diary) {
    self.diary = diary

    $diary // (8)
      .map { $0.completed ? "checkmark.circle.fill" : "circle" }
      .assign(to: \.completionStateIconName, on: self)
      .store(in: &cancellables)

    $diary // (7)
      .map { $0.id }
      .assign(to: \.id, on: self)
      .store(in: &cancellables)

  }
  
}
