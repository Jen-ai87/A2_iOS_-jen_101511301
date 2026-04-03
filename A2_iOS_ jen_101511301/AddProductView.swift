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
