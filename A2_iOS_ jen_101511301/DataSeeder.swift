import CoreData

struct DataSeeder {
    static func seedIfNeeded(context: NSManagedObjectContext) {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        let count = (try? context.count(for: request)) ?? 0
        guard count == 0 else { return }

        let products: [(id: String, name: String, description: String, price: Double, provider: String)] = [
            ("P001", "MacBook Pro 14\"", "Apple silicon laptop with Liquid Retina XDR display, 18-hour battery, and M3 Pro chip for pro-level performance.", 1999.99, "Apple"),
            ("P002", "iPhone 15 Pro", "Titanium smartphone with A17 Pro chip, ProMotion display, and a customizable Action button.", 999.99, "Apple"),
            ("P003", "Samsung Galaxy S24", "Android flagship with Snapdragon 8 Gen 3, 50MP camera, and a bright 6.2-inch Dynamic AMOLED display.", 799.99, "Samsung"),
            ("P004", "Sony WH-1000XM5", "Industry-leading wireless noise cancelling headphones with 30-hour battery and multi-device pairing.", 349.99, "Sony"),
            ("P005", "iPad Air M2", "Thin and versatile tablet powered by M2 chip, perfect for creativity, productivity, and entertainment.", 599.99, "Apple"),
            ("P006", "Dell XPS 15", "Premium Windows laptop with InfinityEdge display, Intel Core i9, and NVIDIA GeForce RTX 4070 GPU.", 1499.99, "Dell"),
            ("P007", "LG OLED 55\" TV", "55-inch 4K OLED TV with self-lit pixels, perfect blacks, Dolby Vision IQ, and webOS smart platform.", 1299.99, "LG"),
            ("P008", "Bose SoundLink Flex", "Portable waterproof Bluetooth speaker with 12-hour battery and powerful 360-degree sound.", 149.99, "Bose"),
            ("P009", "Nintendo Switch OLED", "Hybrid gaming console with vibrant 7-inch OLED screen, enhanced audio, and 64GB internal storage.", 349.99, "Nintendo"),
            ("P010", "Logitech MX Master 3", "Advanced wireless ergonomic mouse with MagSpeed scroll wheel, 7 buttons, and multi-device support.", 99.99, "Logitech"),
        ]

        for item in products {
            let product = Product(context: context)
            product.productID = item.id
            product.name = item.name
            product.productDescription = item.description
            product.price = item.price
            product.provider = item.provider
        }

        try? context.save()
    }
}

