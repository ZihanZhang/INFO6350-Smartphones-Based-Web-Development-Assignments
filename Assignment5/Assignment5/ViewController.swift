//
//  ViewController.swift
//  Assignment5
//
//  Created by Zihan Zhang on 2017/10/28.
//  Copyright © 2017年 Zihan Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var AddBtn: UIButton!
    @IBOutlet weak var SearchBtn: UIButton!
    @IBOutlet weak var ListBtn: UIButton!
    @IBOutlet weak var DeleteBtn: UIButton!
    @IBOutlet weak var listView: UITableView!
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.items.count
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = store.items[indexPath.row].itemName + "                       " + String(store.items[indexPath.row].itemPrice) + "                  " + store.items[indexPath.row].itemDescription
        
        return cell
    }
    
    @objc public func updateList() {
        listView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateList), name: NSNotification.Name(rawValue: "callForUpdate"), object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

