import SwiftUI
import CoreData

struct ProductListView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: true)],
        animation: .default
    )
    private var products: FetchedResults<Product>

    var body: some View {
        NavigationStack {
            List(products) { product in
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
            .navigationTitle("All Products")
            .overlay {
                if products.isEmpty {
                    ContentUnavailableView("No Products", systemImage: "shippingbox")
                }
            }
        }
    }
}

struct ProductDetailView: View {
    let product: Product

    var body: some View {
        List {
            Section("Product Info") {
                LabeledContent("ID", value: product.productID ?? "")
                LabeledContent("Name", value: product.name ?? "")
                LabeledContent("Provider", value: product.provider ?? "")
                LabeledContent("Price", value: String(format: "$%.2f", product.price))
            }
            Section("Description") {
                Text(product.productDescription ?? "")
                    .font(.body)
            }
        }
        .navigationTitle(product.name ?? "Product")
        .navigationBarTitleDisplayMode(.inline)
    }
}

