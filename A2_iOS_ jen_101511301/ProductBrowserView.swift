import SwiftUI
import CoreData

struct ProductBrowserView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: true)],
        animation: .default
    )
    private var products: FetchedResults<Product>

    @State private var currentIndex: Int = 0

    
    
}




