//
//  listViewController.swift
//  Assignment5
//
//  Created by Zihan Zhang on 2017/10/29.
//  Copyright © 2017年 Zihan Zhang. All rights reserved.
//

import UIKit

class listViewController: UIViewController {
    @IBOutlet weak var listTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var result: String = ""
        for i in curPurchase.items {
            result = result + "\n" + i.itemName
            listTextView?.text = result
        }
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
