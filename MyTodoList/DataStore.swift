//
//  DataStore.swift
//  MyTodoList
//
//  Created by Jan Hovland on 07/09/2020.
//

import Foundation
import CoreData

class DataStore {
    static let shared = DataStore()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyDataModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error)
            }
            
        }
        return container
    }()
    
    private init() {
        
    }
    
    public func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            }catch {
                print(error)
            }
        }
    }
    
}
