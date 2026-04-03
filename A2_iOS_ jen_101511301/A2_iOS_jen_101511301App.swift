import SwiftUI
import CoreData

@main
struct A2_iOS_jen_101511301App: App {
    let persistenceController = PersistenceController.shared

    init() {
        DataSeeder.seedIfNeeded(context: PersistenceController.shared.container.viewContext)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
