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

    
}
