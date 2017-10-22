//
//  ViewController.swift
//  Test
//
//  Created by Zihan Zhang on 2017/10/21.
//  Copyright © 2017年 Zihan Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myLabel.text = "Modified"
    }

    @IBAction func button(_ sender: Any) {
        print("123")
        let alert = UIAlertController(title:"Aleert", message: "Button clicked", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title:"OK",style: UIAlertActionStyle.default, handler:nil))
        self.present(alert, animated:true, completion:nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

