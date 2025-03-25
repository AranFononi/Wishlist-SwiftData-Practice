//
//  Wish_ListApp.swift
//  Wish List
//
//  Created by Aran Fononi on 26/3/25.
//

import SwiftUI
import SwiftData

@main
struct Wish_ListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}
