//
//  CoreDataStack.swift
//  UIKit_CoreData
//
//  Created by 강창현 on 2/19/24.
//

import CoreData
import Foundation

class CoreDataStack {
    static let shared = CoreDataStack()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Failed to load persistent stores: \(error.localizedDescription)")
            }
        }
        return container
    }()
}

extension CoreDataStack {
    func save() {
        guard persistentContainer.viewContext.hasChanges else { return }
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save the context:",error.localizedDescription)
        }
    }
    
    func delete() {
        persistentContainer.viewContext.delete(<#T##object: NSManagedObject##NSManagedObject#>)
    }
}
