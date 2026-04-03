import SwiftUI
import CoreData

struct ProductBrowserView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: true)],
        animation: .default
    )
    private var products: FetchedResults<Product>

    @State private var currentIndex: Int = 0

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                if products.isEmpty {
                    ContentUnavailableView("No Products", systemImage: "shippingbox")
                } else {
                    let product = products[currentIndex]

                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                Spacer()
                                Text("\(currentIndex + 1) of \(products.count)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .padding(.vertical, 4)
                                    .padding(.horizontal, 10)
                                    .background(Color(.systemGray6))
                                    .clipShape(Capsule())
                                Spacer()
                            }
                            .padding(.top, 8)

                            VStack(alignment: .leading, spacing: 16) {
                                HStack(alignment: .top) {
                                    Image(systemName: "shippingbox.fill")
                                        .font(.largeTitle)
                                        .foregroundStyle(.blue)
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(product.name ?? "")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                        Text(product.provider ?? "")
                                            .font(.subheadline)
                                            .foregroundStyle(.secondary)
                                    }
                                }

                                Divider()

                                DetailRow(label: "Product ID", value: product.productID ?? "")
                                DetailRow(label: "Description", value: product.productDescription ?? "")
                                DetailRow(label: "Price", value: String(format: "$%.2f", product.price))
                                DetailRow(label: "Provider", value: product.provider ?? "")
                            }
                            .padding()
                            .background(Color(.systemBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 2)
                            .padding(.horizontal)
                        }
                        .padding(.bottom, 16)
                    }

                    HStack(spacing: 40) {
                        Button(action: { currentIndex -= 1 }) {
                            Label("Previous", systemImage: "chevron.left")
                                .font(.headline)
                        }
                        .buttonStyle(.bordered)
                        .disabled(currentIndex == 0)

                        Button(action: { currentIndex += 1 }) {
                            Label("Next", systemImage: "chevron.right")
                                .font(.headline)
                                .labelStyle(.titleAndIcon)
                        }
                        .buttonStyle(.bordered)
                        .disabled(currentIndex == products.count - 1)
                    }
                    .padding(.vertical, 16)
                }
            }
            .navigationTitle("Browse Products")
            .navigationBarTitleDisplayMode(.large)
        }
        .onChange(of: products.count) {
            if currentIndex >= products.count && products.count > 0 {
                currentIndex = products.count - 1
            }
        }
    }
}

struct DetailRow: View {
    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .textCase(.uppercase)
            Text(value)
                .font(.body)
        }
    }
}


