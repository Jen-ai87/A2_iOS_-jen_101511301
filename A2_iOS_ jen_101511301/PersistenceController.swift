import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "A2_iOS_jen_101511301")
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Core Data store failed to load: \(error.localizedDescription)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }

  
}
