//
//  listViewController.swift
//  Assignment5
//
//  Created by Zihan Zhang on 2017/10/29.
//  Copyright © 2017年 Zihan Zhang. All rights reserved.
//

import UIKit

class listViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var llistView: UITableView!
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curPurchase.items.count
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "listcell")
        cell.textLabel?.text = curPurchase.items[indexPath.row].itemName
        var image: UIImage = UIImage(named: curPurchase.items[indexPath.row].itemName + ".jpeg")!
        cell.imageView?.image = image
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailViewController") as? detailViewController {
            viewController.setCurItem(curPurchase.items[indexPath.row])
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
        
    }
    
    @objc public func updateList() {
        llistView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var result: String = ""
//        for i in curPurchase.items {
//            result = result + "\n" + i.itemName
//            listTextView?.text = result
//        }
        NotificationCenter.default.addObserver(self, selector: #selector(updateList), name: NSNotification.Name(rawValue: "callForUpdate"), object: nil)
        
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
