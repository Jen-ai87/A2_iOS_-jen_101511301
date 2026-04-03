import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProductBrowserView()
                .tabItem {
                    Label("Browse", systemImage: "house.fill")
                }

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            ProductListView()
                .tabItem {
                    Label("All Products", systemImage: "list.bullet")
                }

            AddProductView()
                .tabItem {
                    Label("Add", systemImage: "plus.circle.fill")
                }
        }
    }
}
