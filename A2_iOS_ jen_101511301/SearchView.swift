import SwiftUI
import CoreData

struct SearchView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: true)],
        animation: .default
    )
    private var products: FetchedResults<Product>

    @State private var searchText: String = ""

    private var filtered: [Product] {
        guard !searchText.trimmingCharacters(in: .whitespaces).isEmpty else {
            return Array(products)
        }
        let query = searchText.lowercased()
        return products.filter {
            ($0.name ?? "").lowercased().contains(query) ||
            ($0.productDescription ?? "").lowercased().contains(query)
        }
    }

    var body: some View {
        NavigationStack {
            List(filtered, id: \.objectID) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(product.name ?? "")
                            .font(.headline)
                        Text(product.productDescription ?? "")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                    }
                    .padding(.vertical, 4)
                }
            }
            .searchable(text: $searchText, prompt: "Search by name or description")
            .navigationTitle("Search")
            .overlay {
                if filtered.isEmpty {
                    ContentUnavailableView.search(text: searchText)
                }
            }
        }
    }
}
