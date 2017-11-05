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
            var image: UIImage = UIImage(named: searchStoreItems[indexPath.section][indexPath.row].itemName + ".jpeg")!
            cell.imageView?.image = image
        }
        else {
            cell.textLabel?.text = storeItems[indexPath.section][indexPath.row].itemName
            var image: UIImage = UIImage(named: storeItems[indexPath.section][indexPath.row].itemName + ".jpeg")!
            cell.imageView?.image = image
        }
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailViewController") as? detailViewController {
            viewController.setCurItem(storeItems[indexPath.section][indexPath.row])
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
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
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            updateList()
        }
        else {
            isSearching = true
            searchFruit.items = Fruit.items.filter{$0.itemName == searchBar.text}
            searchMeat.items = Meat.items.filter{$0.itemName == searchBar.text}
            searchSections.append(searchFruit)
            searchSections.append(searchMeat)
            searchStoreItems = [searchFruit.items, searchMeat.items]
            updateList()
        }
    }


}

