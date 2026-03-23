// ContentView.swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                MenuListView(items: drinks, accentColor: .blue)
                    .navigationTitle("Пијалоци")
                    .toolbar {
                        NavigationLink(destination: RandomCocktailView()) {
                            Image(systemName: "shuffle")
                                        .foregroundStyle(.blue)
                    }
                }
            }
            .tabItem {
                Label("Пијалоци", systemImage: "cup.and.saucer.fill")
            }

            NavigationStack {
                MenuListView(items: foods, accentColor: .orange)
                    .navigationTitle("Храна")
            }
            .tabItem {
                Label("Храна", systemImage: "fork.knife")
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
        .environmentObject(AppState())
}
