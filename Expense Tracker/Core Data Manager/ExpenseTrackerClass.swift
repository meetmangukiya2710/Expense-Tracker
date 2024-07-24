//
//  ExpenseTrackerClass.swift
//  Expense Tracker
//
//  Created by R95 on 11/07/24.
//

import UIKit
import CoreData

struct DataStr {
    var money: Int
    var type: String
    var detail: String
    var date: Date
    var category: String
}

var array = [DataStr]()
var MTClassObj = MoneyTrackerCoreDataClass()

class MoneyTrackerCoreDataClass {    
    var context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    var fetchData = NSFetchRequest<NSFetchRequestResult>(entityName: "Money")
    
    func addData(money: Int, type: String, detail: String, date: Date, category: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: "Money", in: context!) else { return }
        let newData = NSManagedObject(entity: entity, insertInto: context)
        newData.setValue(money, forKey: "money")
        newData.setValue(type, forKey: "type")
        newData.setValue(detail, forKey: "detail")
        newData.setValue(date, forKey: "date")
        newData.setValue(category, forKey: "category")
        NSLog("Add Data 📊 👍")
        saveData()
    }
    
    private func saveData() {
        do {
            try context?.save()
        } catch {
            NSLog("Error \(error.localizedDescription)")
        }
    }
    
    func getData() {
        do {
            if let result = try context?.fetch(fetchData) as? [NSManagedObject] {
                for data in result {
                    let money = data.value(forKey: "money") as? Int ?? 0
                    let type = data.value(forKey: "type") as? String ?? ""
                    let detail = data.value(forKey: "detail") as? String ?? ""
                    let date = data.value(forKey: "date") as? Date ?? Date.now
                    let category = data.value(forKey: "category") as? String ?? ""
                    let details = DataStr(money: money, type: type, detail: detail, date: date, category: category)
                    NSLog("Get Data 📊 👍")
                    array.append(details)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteData(money: Int) {
        fetchData.predicate = NSPredicate(format: "money == %d", money)
            
            do {
                let objects = try context?.fetch(fetchData) as? [NSManagedObject]
                guard let fetchedObjects = objects else { return }
                
                for object in fetchedObjects {
                    context?.delete(object)
                }
                
                saveData()
                NSLog("Data Deleted 🗑️")
            } catch {
                NSLog("Error deleting data: \(error.localizedDescription)")
            }
        }
}
