//
//  BadgeBugApp.swift
//  BadgeBug
//
//  Created by Valerio Fornito on 14/06/21.
//

import SwiftUI

@main
struct BadgeBugApp: App {
    @ObservedObject private var counterViewModel = CounterViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.counterViewModel)         
        }
    }
}
