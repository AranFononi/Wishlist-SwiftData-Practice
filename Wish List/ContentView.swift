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
    

#Preview("List with Sample Data") {
    let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    container.mainContext.insert(Wish(title: "Test Wish"))
    container.mainContext.insert(Wish(title: "Buy a Mac"))
    container.mainContext.insert(Wish(title: "Finish This Chapter"))
    container.mainContext.insert(Wish(title: "Buy an iPhone"))
    container.mainContext.insert(Wish(title: "Master SwiftData"))

    return ContentView()
        .modelContainer(container)
    
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
