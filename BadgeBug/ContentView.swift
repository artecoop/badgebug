//
//  ContentView.swift
//  BadgeBug
//
//  Created by Valerio Fornito on 14/06/21.
//

import Combine
import Foundation
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var counterViewModel: CounterViewModel
    @State private var counterCancellable: AnyCancellable?

    var body: some View {
        VStack {
            Text("Hello World!")
            HStack {
                Button("+") {
                    self.counterViewModel.up()
                }
                Button("-") {
                    self.counterViewModel.down()
                }
            }
        }
        .onAppear {
            do {
                sleep(5)
                self.counterViewModel.set(42)
            }

            UNUserNotificationCenter.current().requestAuthorization(options: .badge) { _, error in
                if error == nil {
                    self.counterCancellable = self.counterViewModel.$notificationCount.sink { count in
                        DispatchQueue.main.async {
                            UIApplication.shared.applicationIconBadgeNumber = count
                        }
                    }
                }
            }
        }
    }
}
