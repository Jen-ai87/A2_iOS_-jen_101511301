import SwiftUI
import CoreData

struct AddProductView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State private var name: String = ""
    @State private var productDescription: String = ""
    @State private var provider: String = ""
    @State private var priceText: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var showSuccess: Bool = false

    var body: some View {
        NavigationStack {
            Form {
                Section("Product Details") {
                    TextField("Product Name", text: $name)
                    TextField("Provider", text: $provider)
                    TextField("Price (e.g. 29.99)", text: $priceText)
                        .keyboardType(.decimalPad)
                }

                Section("Description") {
                    TextField("Product Description", text: $productDescription, axis: .vertical)
                        .lineLimit(4, reservesSpace: true)
                }

                Section {
                    Button(action: saveProduct) {
                        HStack {
                            Spacer()
                            Label("Save Product", systemImage: "checkmark.circle.fill")
                                .font(.headline)
                            Spacer()
                        }
                    }
                    .tint(.blue)
                }
            }
            .navigationTitle("Add Product")
            .alert("Invalid Input", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(alertMessage)
            }
            .alert("Product Added", isPresented: $showSuccess) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("\(name) has been added successfully.")
            }
        }
    }

    private func saveProduct() {
        let trimmedName = name.trimmingCharacters(in: .whitespaces)
        let trimmedDesc = productDescription.trimmingCharacters(in: .whitespaces)
        let trimmedProvider = provider.trimmingCharacters(in: .whitespaces)

        guard !trimmedName.isEmpty else {
            alertMessage = "Product name cannot be empty."
            showAlert = true
            return
        }
        guard !trimmedProvider.isEmpty else {
            alertMessage = "Provider cannot be empty."
            showAlert = true
            return
        }
        guard let price = Double(priceText.trimmingCharacters(in: .whitespaces)), price >= 0 else {
            alertMessage = "Please enter a valid price."
            showAlert = true
            return
        }

        let product = Product(context: viewContext)
        product.productID = "P\(Int.random(in: 100...999))"
        product.name = trimmedName
        product.productDescription = trimmedDesc
        product.price = price
        product.provider = trimmedProvider

        try? viewContext.save()

        name = ""
        productDescription = ""
        provider = ""
        priceText = ""
        showSuccess = true
    }
}
