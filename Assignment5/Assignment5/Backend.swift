//
//  Backend.swift
//  EmptyApp
//
//  Created by Zihan Zhang on 2017/10/22.
//  Copyright © 2017年 rab. All rights reserved.
//

import Foundation
import UIKit

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

func begin() {
    let Fruit: Category = Category(name: "Fruit")
    let newItem1: Item = Item(itemName:"Orange", itemDescription:"One Fruit", itemPrice: 5, itemType: Fruit, store: store)
    store.items.append(newItem1)
    let newItem2: Item = Item(itemName:"Apple", itemDescription:"One Fruit", itemPrice: 3, itemType: Fruit, store: store)
    store.items.append(newItem2)
    let newItem3: Item = Item(itemName:"Cherry", itemDescription:"One Fruit", itemPrice: 1, itemType: Fruit, store: store)
    store.items.append(newItem3)
    let Meat: Category = Category(name: "Meat")
    let newItem4: Item = Item(itemName:"Pork", itemDescription:"One Meat", itemPrice: 10, itemType: Meat, store: store)
    store.items.append(newItem4)
    let newItem5: Item = Item(itemName:"Beef", itemDescription:"One Meat", itemPrice: 10, itemType: Meat, store: store)
    store.items.append(newItem5)
    let newItem6: Item = Item(itemName:"Lamb", itemDescription:"One Meat", itemPrice: 15, itemType: Meat, store: store)
    store.items.append(newItem6)

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
