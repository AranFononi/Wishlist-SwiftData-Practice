//
//  ContentView.swift
//  Wish List
//
//  Created by Aran Fononi on 26/3/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                }
            }// List
            .navigationTitle("Wishlist")
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView("My Wishlist", systemImage: "heart.circle", description: Text("No wishes yet. Add one to get started!"))
                }
            }
        }
    }
}
    
#Preview {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
