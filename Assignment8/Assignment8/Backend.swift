//
//  Backend.swift
//  EmptyApp
//
//  Created by Zihan Zhang on 2017/10/22.
//  Copyright © 2017年 rab. All rights reserved.
//

import Foundation
import UIKit
import CoreData

//print("Hello, World!")

class Item {
    //    let image: NSImage
    let itemDescription: String
    let itemName: String
    let itemPrice: Int
    
    let itemType: Category
    let store: Store
    var purchase: Purchase?
    
    init(itemName: String, itemDescription: String, itemPrice: Int, itemType: Category, store: Store) {
        self.itemName = itemName
        self.itemDescription = itemDescription
        self.itemType = itemType
        self.itemPrice = itemPrice
        self.store = store
    }
    
}

class Store {
    let address: String
    let name: String
    let phone: String
    
    var items: [Item] = [Item]()
    
    init(address: String, name: String, phone: String) {
        self.address = address
        self.name = name
        self.phone = phone
    }
}

class Category {
    let name: String
    var items: [Item] = [Item]()
    
    init(name: String) {
        self.name = name
    }
}

class Purchase {
    let paymentMethod: String
    let pDate: String
    let poNumber: String
    let totalPurchase: Int = 0
    
    var items: [Item] = [Item]()
    
    init(paymentMethod: String, pDate: String, poNumber: String) {
        self.paymentMethod = paymentMethod
        self.pDate = pDate
        self.poNumber = poNumber
    }
}

let store = Store(address: "10 Summer St.", name: "Zihan Store", phone: "781-333-0074")

func saveStoreMeatItemData(item: Item) {
    guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
            return
    }
    
    let managedContext =
        appDelegate.persistentContainer.viewContext
    
    let entity =
        NSEntityDescription.entity(forEntityName: "StoreItemMeatData",
                                   in: managedContext)!
    
    let itemData = NSManagedObject(entity: entity,
                                 insertInto: managedContext)
    itemData.setValue(item.itemName, forKeyPath: "name")
    itemData.setValue(item.itemDescription, forKeyPath: "idescription")
    itemData.setValue(item.itemPrice, forKeyPath: "price")


    do {
        try managedContext.save()
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }
}

func saveStoreFruitItemData(item: Item) {
    guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
            return
    }
    
    let managedContext =
        appDelegate.persistentContainer.viewContext
    
    let entity =
        NSEntityDescription.entity(forEntityName: "StoreItemFruitData",
                                   in: managedContext)!
    
    let itemData = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
    itemData.setValue(item.itemName, forKeyPath: "name")
    itemData.setValue(item.itemDescription, forKeyPath: "idescription")
    itemData.setValue(item.itemPrice, forKeyPath: "price")
    
    
    do {
        try managedContext.save()
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }
}

let curPurchase = Purchase(paymentMethod: "Debit", pDate: "09/20", poNumber: "1234567890")

func Add(t: Item) {
    curPurchase.items.append(t)
    store.items = store.items.filter {$0.itemName != t.itemName}
}

func List() {
    var list: String = ""
    for i in store.items {
        list.append(i.itemName)
        list.append(" ")
    }
    print(list)
}

func Search(name: String) -> Item{
    var result: Item?
    for i in store.items {
        if i.itemName == name {
            result = i
            return i
        }
    }
    return result!
}

func Delete(name: String) {
    var item = curPurchase.items.filter {$0.itemName == name}
    curPurchase.items = curPurchase.items.filter {$0.itemName != name}
    store.items = store.items + item
}

//print("test")
let Fruit: Category = Category(name: "Fruit")
let Meat: Category = Category(name: "Meat")
let sections = [Fruit, Meat]
var storeItems = [Fruit.items, Meat.items]
var addItemImage: [String: UIImage] = [:]

func begin() {
//    clearData()
    guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
            return
    }

    let managedContext =
        appDelegate.persistentContainer.viewContext

    let entity =
        NSEntityDescription.entity(forEntityName: "Start",
                                   in: managedContext)!

    let startData = NSManagedObject(entity: entity,
                                   insertInto: managedContext)

    let startFetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "Start")


    do {
        let start = try managedContext.fetch(startFetchRequest)
        if start[0].value(forKeyPath: "startedbefore") as! Bool == true {
            return
        }
        else {
            startData.setValue(true, forKeyPath: "startedbefore")
            try managedContext.save()
        }
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }

    clearData()
    let newItem1: Item = Item(itemName:"Orange", itemDescription:"One Fruit", itemPrice: 5, itemType: Fruit, store: store)
    Fruit.items.append(newItem1)
    store.items.append(newItem1)
    saveStoreFruitItemData(item: newItem1)
    let newItem2: Item = Item(itemName:"Apple", itemDescription:"One Fruit", itemPrice: 3, itemType: Fruit, store: store)
    Fruit.items.append(newItem2)
    store.items.append(newItem2)
    saveStoreFruitItemData(item: newItem2)
    let newItem3: Item = Item(itemName:"Cherry", itemDescription:"One Fruit", itemPrice: 1, itemType: Fruit, store: store)
    Fruit.items.append(newItem3)
    store.items.append(newItem3)
    saveStoreFruitItemData(item: newItem3)
    let newItem4: Item = Item(itemName:"Pork", itemDescription:"One Meat", itemPrice: 10, itemType: Meat, store: store)
    Meat.items.append(newItem4)
    store.items.append(newItem4)
    saveStoreMeatItemData(item: newItem4)
    let newItem5: Item = Item(itemName:"Beef", itemDescription:"One Meat", itemPrice: 10, itemType: Meat, store: store)
    Meat.items.append(newItem5)
    store.items.append(newItem5)
    saveStoreMeatItemData(item: newItem5)
    let newItem6: Item = Item(itemName:"Lamb", itemDescription:"One Meat", itemPrice: 15, itemType: Meat, store: store)
    Meat.items.append(newItem6)
    store.items.append(newItem6)
    saveStoreMeatItemData(item: newItem6)
//    clearData()
}

func clearData() {
    guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
            return
    }
    
    let managedContext =
        appDelegate.persistentContainer.viewContext
    
    let meatFetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "StoreItemMeatData")
    
    let fruitFetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "StoreItemFruitData")
    
    let purchaseFetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "PurchaseItemData")
    
    do {
        let meat = try managedContext.fetch(meatFetchRequest)
        let fruit = try managedContext.fetch(fruitFetchRequest)
        let purchase = try managedContext.fetch(purchaseFetchRequest)
        
        for p in purchase {
            managedContext.delete(p)
        }
        
        for m in meat {
            managedContext.delete(m)
        }
        
        for f in fruit {
            managedContext.delete(f)
        }
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
    }
}

func updataData() {
    guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
            return
    }
    
    let managedContext =
        appDelegate.persistentContainer.viewContext
    
    let meatFetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "StoreItemMeatData")
    
    let fruitFetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "StoreItemFruitData")
    
    let purchaseFetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "PurchaseItemData")
    
    do {
        let meat = try managedContext.fetch(meatFetchRequest)
        let fruit = try managedContext.fetch(fruitFetchRequest)
        
        let purchase = try managedContext.fetch(purchaseFetchRequest)
        
        print(meat.count)
        print(fruit.count)
        
        var meats:[Item] = []
        var fruits:[Item] = []
        var purchases:[Item] = []
        
        for p in purchase {
            if p.value(forKeyPath: "icategory") as! String == "Meat" {
                let newItem = Item(itemName: p.value(forKeyPath: "name") as! String, itemDescription: p.value(forKeyPath: "idescription") as! String, itemPrice: p.value(forKeyPath: "price") as! Int, itemType: Meat, store: store)
                purchases.append(newItem)
            }
            else {
                let newItem = Item(itemName: p.value(forKeyPath: "name") as! String, itemDescription: p.value(forKeyPath: "idescription") as! String, itemPrice: p.value(forKeyPath: "price") as! Int, itemType: Fruit, store: store)
                purchases.append(newItem)
            }
        }
        
        for m in meat {
            let newItem = Item(itemName: m.value(forKeyPath: "name") as! String, itemDescription: m.value(forKeyPath: "idescription") as! String, itemPrice: m.value(forKeyPath: "price") as! Int, itemType: Meat, store: store)
            meats.append(newItem)
            print(newItem.itemName)
        }
        
        for f in fruit {
            let newItem = Item(itemName: f.value(forKeyPath: "name") as! String, itemDescription: f.value(forKeyPath: "idescription") as! String, itemPrice: f.value(forKeyPath: "price") as! Int, itemType: Fruit, store: store)
            fruits.append(newItem)
            print(newItem.itemName)
        }
        
        Meat.items = meats
        Fruit.items = fruits
        
        storeItems[0] = fruits
        print(storeItems[0].count)
        storeItems[1] = meats
        print(storeItems[1].count)
        
        curPurchase.items = purchases
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
    }
}

func deleteData(item: Item) {
    guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
            return
    }
    
    let managedContext =
        appDelegate.persistentContainer.viewContext
    
    let meatFetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "StoreItemMeatData")
    meatFetchRequest.predicate = NSPredicate(format: "name == %@", item.itemName)
    
    let fruitFetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "StoreItemFruitData")
    fruitFetchRequest.predicate = NSPredicate(format: "name == %@", item.itemName)
    
    do {
        let meat = try managedContext.fetch(meatFetchRequest)
        let fruit = try managedContext.fetch(fruitFetchRequest)
        
        if meat.count > 0 {
            managedContext.delete(meat[0])
        }
        else if fruit.count > 0 {
            managedContext.delete(fruit[0])
        }
        else {
            return
        }
        
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
    }
}

func savePurchaseItemData(item: Item) {
    guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
            return
    }
    
    let managedContext =
        appDelegate.persistentContainer.viewContext
    
    let entity =
        NSEntityDescription.entity(forEntityName: "PurchaseItemData",
                                   in: managedContext)!
    
    let itemData = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
    itemData.setValue(item.itemName, forKeyPath: "name")
    itemData.setValue(item.itemDescription, forKeyPath: "idescription")
    itemData.setValue(item.itemPrice, forKeyPath: "price")
    itemData.setValue(item.itemType.name, forKeyPath: "icategory")
    
    
    do {
        try managedContext.save()
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }
}

func deletePurchaseItemData(item: Item) {
    guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
            return
    }
    
    let managedContext =
        appDelegate.persistentContainer.viewContext
    
    let purchaseFetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "PurchaseItemData")
    purchaseFetchRequest.predicate = NSPredicate(format: "name == %@", item.itemName)
    
    do {
        let purchase = try managedContext.fetch(purchaseFetchRequest)
        
        managedContext.delete(purchase[0])
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
    }
}



//print("Welcome to Zihan's Store")
//print("Now we have these: ")
//
////Add(t: newItem1)
////
//List()
//
//while(true) {
//    print("1. Input items you want to add to your wish list: ")
//    print("2. Search for an item: ")
//    print("3. Delete an item from wish list")
//    print("4. End shopping")
//    print("Please input your choice")
//
//    let choice = readLine()
//    if choice == "1" {
//        print("Please input item name: ")
//        let name = readLine()
//        for i in store.items {
//            if i.itemName == name {
//                print("Add Item Succeed!\n Now we have: ")
//                Add(t: i)
//                var list: String = ""
//                for j in store.items {
//                    list.append(j.itemName)
//                    list.append(" ")
//                }
//                print(list)
//            }
//        }
//    }
//    else if choice == "2" {
//        print("Please input item name: ")
//        let name = readLine()
//        let item: Item = Search(name: name!)
//        print("We have \(item.itemName)")
//    }
//    else if choice == "3" {
//        print("Please input item you want to delete: ")
//        let name = readLine()
//        Delete(name: name!)
//        print("Delete Succeed!")
//        print("Now we have: ")
//        List()
//    }
//    else if choice == "4" {
//        exit(0)
//    }
//}
//
