import SwiftUI
import CoreData

struct ProductListView: View {
    
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

