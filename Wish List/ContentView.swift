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
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title2.weight(.medium))
                        .padding(.vertical,5)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(wish)
                            }
                        }
                }
            }// List
            .navigationTitle("Wishlist")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                
                if wishes.isEmpty != true {
                    ToolbarItem(placement: .bottomBar) {
                        Text("\(wishes.count) wish\(wishes.count > 1 ? "es" : "")")
                    }
                }
            }
            .alert("Create a new wish", isPresented: $isAlertShowing) {
                TextField("Enter a wish", text: $title)
                
                Button {
                    if title != ""{
                        modelContext.insert(Wish(title: title))
                    }
                    title = ""
                } label: {
                    Text("Save")
                }
            }
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
