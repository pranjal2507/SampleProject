//
//  PersistenceStorage.swift
//  SampleApiProject
//
//  Created by Pranjal Agarwal on 14/02/23.
//

import Foundation
import CoreData


class PersistentStorage{
    
    static let shared = PersistentStorage()
    
    private init(){}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SampleApiProject")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
