//
//  DataStore.swift
//  SlapChat
//
//  Created by Ian Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreData

class DataStore {
    
    static let sharedInstance = DataStore()
    
    var messages = [Message]()
    
    private init() {}
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "SlapChat")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchData() {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Message>(entityName: "Message")
        
        do {
            messages = try context.fetch(fetchRequest)
            let sortedArr = try messages.sorted(by: { (messageA, messageB) -> Bool in
                var messageA = messageA.createdAt as! Date
                var messageB = messageB.createdAt as! Date
                
        
            return messageA.compare(messageB) == ComparisonResult.orderedAscending
            
            })
            
            if messages.count == 0 {
                createTestData()
            }
                print(sortedArr)
            
            }
        catch {}
    }
   
    func descending () {
        messages.sort { (messageA, messageB) -> Bool in
            var messageA = messageA.createdAt as! Date
            var messageB = messageB.createdAt as! Date
            
            
            return messageA.compare(messageB) == ComparisonResult.orderedDescending
            

        }
    }
    
    func ascending () {
        messages.sort { (messageA, messageB) -> Bool in
            var messageA = messageA.createdAt as! Date
            var messageB = messageB.createdAt as! Date
            

            
            return messageA.compare(messageB) == ComparisonResult.orderedAscending
        }
    }
    
    
    func createTestData () {
        let context = persistentContainer.viewContext
        let newEntity = Message(context: context)
        let newEntity2 = Message(context: context)
        newEntity.createdAt = Date() as NSDate?
        newEntity.content = "Hello"
        newEntity2.createdAt = Date() as NSDate?
        newEntity2.content = "No"
        let newEntity3 = Message(context: context)
        newEntity3.createdAt = Date() as NSDate?
        newEntity3.content = "Holla"
        saveContext()
        fetchData()
    }
    
    func createNewData (message: String) {
        let context = persistentContainer.viewContext
        let newData = Message(context: context)
        newData.content = message
        newData.createdAt = Date() as NSDate
        saveContext()
        fetchData()
        
        
    }

    

}
