//
//  detailViewController.swift
//  Assignment6
//
//  Created by Zihan Zhang on 2017/11/2.
//  Copyright © 2017年 Zihan Zhang. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailTextView: UITextView!
    var curItem: Item?
    var result: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: (curItem?.itemName)! + ".jpeg")
        result = result + "Item Name: " + (curItem?.itemName)! + "\n"
        result = result + "Item Price: " + String(describing: (curItem?.itemPrice)!) + "\n"
        result = result + "Item Description: " + (curItem?.itemDescription)! + "\n"
        result = result + "Item Category: " + (curItem?.itemType.name)! + "\n"
        detailTextView.text = result
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func setCurItem(_ item: Item) {
        self.curItem = item
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
