//
//  CounterViewModel.swift
//  BadgeBug
//
//  Created by Valerio Fornito on 14/06/21.
//

import Combine
import Foundation

class CounterViewModel: ObservableObject {
    @Published private(set) var notificationCount = 0

    func up() {
        self.notificationCount += 1
    }

    func down() {
        self.notificationCount -= 1
    }
    
    func set(_ count: Int) {
        self.notificationCount = count
    }
}
