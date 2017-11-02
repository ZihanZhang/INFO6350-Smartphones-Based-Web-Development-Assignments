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
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].name
    }
    
    @available(iOS 2.0, *)
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "storecell")
        cell.textLabel?.text = storeItems[indexPath.section][indexPath.row].itemName
        var image: UIImage = UIImage(named: storeItems[indexPath.section][indexPath.row].itemName + ".jpeg")!
        cell.imageView?.image = image
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

