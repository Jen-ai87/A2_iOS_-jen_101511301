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

           
        }
    }
}
