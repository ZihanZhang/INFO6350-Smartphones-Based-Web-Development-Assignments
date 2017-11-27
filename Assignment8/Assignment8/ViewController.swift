//
//  ViewController.swift
//  Assignment5
//
//  Created by Zihan Zhang on 2017/10/28.
//  Copyright © 2017年 Zihan Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet weak var AddBtn: UIButton!
    @IBOutlet weak var SearchBtn: UIButton!
    @IBOutlet weak var ListBtn: UIButton!
    @IBOutlet weak var DeleteBtn: UIButton!
    @IBOutlet weak var listView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var shopTableView: UITableView!
    
    let searchFruit: Category = Category(name: "Fruit")
    let searchMeat: Category = Category(name: "Meat")
    var searchSections: [Category] = []
    var searchStoreItems: [[Item]] = [[],[]]
    
    var isSearching = false
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].name
    }
    
    @available(iOS 2.0, *)
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return searchStoreItems[section].count
        }
        return sections[section].items.count
    }
    
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "storecell")
        if isSearching {
            cell.textLabel?.text = searchStoreItems[indexPath.section][indexPath.row].itemName
            if addItemImage.keys.contains(searchStoreItems[indexPath.section][indexPath.row].itemName) {
                cell.imageView?.image = addItemImage[searchStoreItems[indexPath.section][indexPath.row].itemName]
            }
            else {
                var image: UIImage = UIImage(named: searchStoreItems[indexPath.section][indexPath.row].itemName + ".jpeg")!
                cell.imageView?.image = image
            }
        }
        else {
            cell.textLabel?.text = storeItems[indexPath.section][indexPath.row].itemName
            if addItemImage.keys.contains(storeItems[indexPath.section][indexPath.row].itemName) {
                cell.imageView?.image = addItemImage[storeItems[indexPath.section][indexPath.row].itemName]
            }
            else {
                var image: UIImage = UIImage(named: storeItems[indexPath.section][indexPath.row].itemName + ".jpeg")!
                cell.imageView?.image = image
            }
        }
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailViewController") as? detailViewController {
//            viewController.setCurItem(storeItems[indexPath.section][indexPath.row])
//            if let navigator = navigationController {
//                navigator.pushViewController(viewController, animated: true)
//            }
//        }
        
        performSegue(withIdentifier: "newsegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newsegue" {
            if let toViewController = segue.destination as? detailViewController {
                toViewController.curItem = storeItems[(shopTableView.indexPathForSelectedRow?.section)!][(shopTableView.indexPathForSelectedRow?.row)!]
            }
        }
    }
    
    @objc public func updateList() {
        listView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateList), name: NSNotification.Name(rawValue: "callForUpdate"), object: nil)
        // Do any additional setup after loading the view, typically from a nib.
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //Use core data to check if Meat and Fruit are the same
        checkMeat(meat: Meat)
        checkFruit(fruit: Fruit)
        searchFruit.items = []
        searchMeat.items = []
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            updateList()
        }
        else {
            isSearching = true
            for i in Fruit.items {
                if i.itemName.count < (searchBar.text?.count)! {
                    continue
                }
                if i.itemName.substring(to: i.itemName.index(i.itemName.startIndex, offsetBy: (searchBar.text?.count)!)) == searchBar.text && !searchFruit.items.contains(where: {$0.itemName == i.itemName}){
                    searchFruit.items.append(i)
                }
            }
            for i in Meat.items {
                if i.itemName.count < (searchBar.text?.count)! {
                    continue
                }
                else if i.itemName.substring(to: i.itemName.index(i.itemName.startIndex, offsetBy: (searchBar.text?.count)!)) == searchBar.text && !searchMeat.items.contains(where: {$0.itemName == i.itemName}){
                    searchMeat.items.append(i)
                }
            }
//            searchFruit.items = Fruit.items.filter{$0.itemName.substring(to: $0.itemName.index($0.itemName.startIndex, offsetBy: (searchBar.text?.count)!)) == searchBar.text}
//            searchMeat.items = Meat.items.filter{$0.itemName.substring(to: $0.itemName.index($0.itemName.startIndex, offsetBy: (searchBar.text?.count)!)) == searchBar.text}
            searchSections.append(searchFruit)
            searchSections.append(searchMeat)
            searchStoreItems = [searchFruit.items, searchMeat.items]
            updateList()
        }
    }
}

