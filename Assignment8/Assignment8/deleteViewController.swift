//
//  deleteViewController.swift
//  Assignment5
//
//  Created by Zihan Zhang on 2017/10/29.
//  Copyright © 2017年 Zihan Zhang. All rights reserved.
//

import UIKit

class deleteViewController: UIViewController {
    @IBOutlet weak var dtextField: UITextField!
    
    
    @IBAction func DeleteItem(_ sender: UIBarButtonItem) {
        var have = false
        let name = dtextField?.text
        for i in curPurchase.items {
            if i.itemName == name {
                have = true
                let item = curPurchase.items.filter {$0.itemName == name}
                deletePurchaseItemData(item: item[0])
                curPurchase.items = curPurchase.items.filter {$0.itemName != name}
                store.items = store.items + item
                if item[0].itemType.name == "Fruit" {
                    saveStoreFruitItemData(item: item[0])
                    Fruit.items.append(item[0])
                }
                else {
                    saveStoreMeatItemData(item: item[0])
                    Meat.items.append(item[0])
                }
                storeItems = [Fruit.items, Meat.items]
                updataData()
            }
        }
        if have {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callForUpdate"), object: nil)
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "Delete Succeed"
            alert.addButton(withTitle: "Understood")
            alert.show()
        }
        else {
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "No match item"
            alert.addButton(withTitle: "Understood")
            alert.show()
            
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
