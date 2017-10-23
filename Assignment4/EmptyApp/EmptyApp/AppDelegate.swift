//
//  AppDelegate.swift
//  EmptyApp
//
//  Created by rab on 10/15/17.
//  Copyright © 2017 rab. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var addView: UIView?
    var mainView: UIView?
    var listView: UIView?
    var searchView: UIView?
    var deleteView: UIView?
    
    var textField1: UITextField?
    var textField2: UITextField?
    var textField3: UITextField?
    var textField4: UITextField?
    var textField5: UITextField?
    
    var stextField: UITextField?
    
    var dtextField: UITextField?
    
    var itemslist:[UIView] = []
    
//    var itemslistlist:[UIView] = []
//
//    var itemssearchlist:[UIView] = []

    var listTextView: UITextView?
    
    var searchTextView: UITextView?
    
    



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.backgroundColor = UIColor.lightGray
            window.rootViewController = UIViewController()
            window.makeKeyAndVisible()
        }
        
        begin()
        
        let mainViewRect: CGRect = CGRect(x:0,y:0,width:500, height:800);
        mainView = UIView(frame:mainViewRect)
        mainView?.backgroundColor = UIColor.white
        window?.addSubview(mainView!); // window is coming soon
        
        let addBtn:UIButton = UIButton(frame: CGRect(x: 100, y: 400, width: 200, height: 40))
        addBtn.setTitle("Add", for: UIControlState.normal)
        addBtn.backgroundColor = UIColor.brown
        addBtn.addTarget(self, action:#selector(showAddView), for: .touchUpInside)
        mainView?.addSubview(addBtn)
        
        let searchBtn:UIButton = UIButton(frame: CGRect(x: 100, y: 450, width: 200, height: 40))
        searchBtn.setTitle("Search", for: UIControlState.normal)
        searchBtn.backgroundColor = UIColor.brown
        searchBtn.addTarget(self, action:#selector(showSearchView), for: .touchUpInside)
        mainView?.addSubview(searchBtn)
        
        let listBtn:UIButton = UIButton(frame: CGRect(x: 100, y: 500, width: 200, height: 40))
        listBtn.setTitle("List", for: UIControlState.normal)
        listBtn.backgroundColor = UIColor.brown
        listBtn.addTarget(self, action:#selector(showListView), for: .touchUpInside)
        mainView?.addSubview(listBtn)
        
        let deleteBtn:UIButton = UIButton(frame: CGRect(x: 100, y: 550, width: 200, height: 40))
        deleteBtn.setTitle("Delete", for: UIControlState.normal)
        deleteBtn.backgroundColor = UIColor.brown
        deleteBtn.addTarget(self, action:#selector(showDeleteView), for: .touchUpInside)
        mainView?.addSubview(deleteBtn)
        
        let srect: CGRect = CGRect(x:100,y:15,width:200,height:50)
        let slabel: UILabel = UILabel(frame: srect)
        slabel.text = "Zihan Store"
        slabel.font = UIFont.boldSystemFont(ofSize: 32.0)
        mainView?.addSubview(slabel)
        
        let tnrect: CGRect = CGRect(x:25,y:50,width:75,height:50)
        let tnlabel: UILabel = UILabel(frame: tnrect)
        tnlabel.text = "Name"
        tnlabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        mainView?.addSubview(tnlabel)
        let tprect: CGRect = CGRect(x:100,y:50,width:50,height:50)
        let tplabel: UILabel = UILabel(frame: tprect)
        tplabel.text = "Price"
        tplabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        mainView?.addSubview(tplabel)
        let tdrect: CGRect = CGRect(x:150,y:50,width:100,height:50)
        let tdlabel: UILabel = UILabel(frame: tdrect)
        tdlabel.text = "Description"
        tdlabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        mainView?.addSubview(tdlabel)
        let tcrect: CGRect = CGRect(x:300,y:50,width:100,height:50)
        let tclabel: UILabel = UILabel(frame: tcrect)
        tclabel.text = "category"
        tclabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        mainView?.addSubview(tclabel)

        
        showList()


        //Add view
        let addViewRect: CGRect = CGRect(x:0, y:0, width:500, height: 800);
        addView = UIView(frame: addViewRect)
        addView?.backgroundColor = UIColor.blue
        addView?.isHidden = true
        window?.addSubview(addView!)
        
        textField1 = UITextField(frame: CGRect(x:125.0, y:200.0, width:200.0, height:30.0))
        textField1?.textAlignment = NSTextAlignment.center
        textField1?.textColor = UIColor.blue
        textField1?.backgroundColor = UIColor.white
        textField1?.borderStyle = UITextBorderStyle.line
        textField1?.autocapitalizationType = UITextAutocapitalizationType.words
        textField1?.clearButtonMode = .whileEditing
        textField1?.placeholder = "Enter text"
        textField1?.keyboardType = .default
        textField1?.returnKeyType = .done
        addView?.addSubview(textField1!)
        
        let rect1:CGRect = CGRect(x:25,y:200,width:100,height:50)
        let label1:UILabel = UILabel(frame: rect1)
        label1.text="Item Name"
        addView?.addSubview(label1)
        
        textField2 = UITextField(frame: CGRect(x:125.0, y:250.0, width:200.0, height:30.0))
        textField2?.textAlignment = NSTextAlignment.center
        textField2?.textColor = UIColor.blue
        textField2?.backgroundColor = UIColor.white
        textField2?.borderStyle = UITextBorderStyle.line
        textField2?.autocapitalizationType = UITextAutocapitalizationType.words
        textField2?.clearButtonMode = .whileEditing
        textField2?.placeholder = "Enter text"
        textField2?.keyboardType = .default
        textField2?.returnKeyType = .done
        addView?.addSubview(textField2!)
        
        let rect2:CGRect = CGRect(x:25,y:250,width:100,height:50)
        let label2:UILabel = UILabel(frame: rect2)
        label2.text="Item Price"
        addView?.addSubview(label2)


        
        textField3 = UITextField(frame: CGRect(x:125.0, y:300.0, width:200.0, height:30.0))
        textField3?.textAlignment = NSTextAlignment.center
        textField3?.textColor = UIColor.blue
        textField3?.backgroundColor = UIColor.white
        textField3?.borderStyle = UITextBorderStyle.line
        textField3?.autocapitalizationType = UITextAutocapitalizationType.words
        textField3?.clearButtonMode = .whileEditing
        textField3?.placeholder = "Enter text"
        textField3?.keyboardType = .default
        textField3?.returnKeyType = .done
        addView?.addSubview(textField3!)
        
        let rect3:CGRect = CGRect(x:25,y:300,width:100,height:50)
        let label3:UILabel = UILabel(frame: rect3)
        label3.text="Item Description"
        addView?.addSubview(label3)

        
        textField4 = UITextField(frame: CGRect(x:125.0, y:350.0, width:200.0, height:30.0))
        textField4?.textAlignment = NSTextAlignment.center
        textField4?.textColor = UIColor.blue
        textField4?.backgroundColor = UIColor.white
        textField4?.borderStyle = UITextBorderStyle.line
        textField4?.autocapitalizationType = UITextAutocapitalizationType.words
        textField4?.clearButtonMode = .whileEditing
        textField4?.placeholder = "Zihan Store"
        textField4?.keyboardType = .default
        textField4?.returnKeyType = .done
        addView?.addSubview(textField4!)
        
        let rect4:CGRect = CGRect(x:25,y:350,width:100,height:50)
        let label4:UILabel = UILabel(frame: rect4)
        label4.text="Item Store"
        addView?.addSubview(label4)

        
        textField5 = UITextField(frame: CGRect(x:125.0, y:400.0, width:200.0, height:30.0))
        textField5?.textAlignment = NSTextAlignment.center
        textField5?.textColor = UIColor.blue
        textField5?.backgroundColor = UIColor.white
        textField5?.borderStyle = UITextBorderStyle.line
        textField5?.autocapitalizationType = UITextAutocapitalizationType.words
        textField5?.clearButtonMode = .whileEditing
        textField5?.placeholder = "Enter text"
        textField5?.keyboardType = .default
        textField5?.returnKeyType = .done
        addView?.addSubview(textField5!)
        
        let rect5:CGRect = CGRect(x:25,y:400,width:100,height:50)
        let label5:UILabel = UILabel(frame: rect5)
        label5.text="Item Category"
        addView?.addSubview(label5)
        
        let addButton: UIButton = UIButton(frame: CGRect(x: 50, y: 450, width: 150, height: 40))
        addButton.setTitle("Add", for: UIControlState.normal)
        addButton.backgroundColor = UIColor.brown
        addButton.addTarget(self, action:#selector(addDoneView), for: .touchUpInside)
        addView?.addSubview(addButton)
        
        let rAddButton: UIButton = UIButton(frame: CGRect(x: 250, y: 450, width: 150, height: 40))
        rAddButton.setTitle("Return", for: UIControlState.normal)
        rAddButton.backgroundColor = UIColor.brown
        rAddButton.addTarget(self, action:#selector(hideAddView), for: .touchUpInside)
        addView?.addSubview(rAddButton)

        
        //List View
        let listRect: CGRect = CGRect(x:0, y:0, width:500, height: 800);
        listView = UIView(frame: listRect)
        listView?.backgroundColor = UIColor.blue
        listView?.isHidden = true
        window?.addSubview(listView!)
        
        
        let listButton: UIButton = UIButton(frame: CGRect(x: 100, y: 450, width: 200, height: 40))
        listButton.setTitle("Return", for: UIControlState.normal)
        listButton.backgroundColor = UIColor.brown
        listButton.addTarget(self, action:#selector(hideListView), for: .touchUpInside)
        listView?.addSubview(listButton)
        
        let ltextRect: CGRect = CGRect(x:50, y:50, width: 320, height: 350)
        listTextView = UITextView(frame: ltextRect)
        listTextView?.isEditable = false
        listView?.addSubview(listTextView!)
        

        
        
        //Search View
        let searchRect: CGRect = CGRect(x:0, y:0, width:500, height: 800);
        searchView = UIView(frame: searchRect)
        searchView?.backgroundColor = UIColor.blue
        searchView?.isHidden = true
        window?.addSubview(searchView!)
        
        let searchButton: UIButton = UIButton(frame: CGRect(x: 50, y: 550, width: 150, height: 40))
        searchButton.setTitle("Search", for: UIControlState.normal)
        searchButton.backgroundColor = UIColor.brown
        searchButton.addTarget(self, action:#selector(showSearchResultView), for: .touchUpInside)
        searchView?.addSubview(searchButton)
        
        let rSearchButton: UIButton = UIButton(frame: CGRect(x: 250, y: 550, width: 150, height: 40))
        rSearchButton.setTitle("Return", for: UIControlState.normal)
        rSearchButton.backgroundColor = UIColor.brown
        rSearchButton.addTarget(self, action:#selector(hideSearchView), for: .touchUpInside)
        searchView?.addSubview(rSearchButton)

        stextField = UITextField(frame: CGRect(x:125.0, y:450.0, width:200.0, height:30.0))
        stextField?.textAlignment = NSTextAlignment.center
        stextField?.textColor = UIColor.blue
        stextField?.backgroundColor = UIColor.white
        stextField?.borderStyle = UITextBorderStyle.line
        stextField?.autocapitalizationType = UITextAutocapitalizationType.words
        stextField?.clearButtonMode = .whileEditing
        stextField?.placeholder = "Enter text"
        stextField?.keyboardType = .default
        stextField?.returnKeyType = .done
        searchView?.addSubview(stextField!)
        
        let stextRect: CGRect = CGRect(x:50, y:50, width: 320, height: 350)
        searchTextView = UITextView(frame: stextRect)
        searchTextView?.isEditable = false
        searchView?.addSubview(searchTextView!)

        
        //Delete View
        let deleteRect: CGRect = CGRect(x:0, y:0, width:500, height: 800);
        deleteView = UIView(frame: deleteRect)
        deleteView?.backgroundColor = UIColor.blue
        deleteView?.isHidden = true
        window?.addSubview(deleteView!)
        
        dtextField = UITextField(frame: CGRect(x:125.0, y:350.0, width:200.0, height:30.0))
        dtextField?.textAlignment = NSTextAlignment.center
        dtextField?.textColor = UIColor.blue
        dtextField?.backgroundColor = UIColor.white
        dtextField?.borderStyle = UITextBorderStyle.line
        dtextField?.autocapitalizationType = UITextAutocapitalizationType.words
        dtextField?.clearButtonMode = .whileEditing
        dtextField?.placeholder = "Enter text"
        dtextField?.keyboardType = .default
        dtextField?.returnKeyType = .done
        deleteView?.addSubview(dtextField!)
        
        let deleteButton: UIButton = UIButton(frame: CGRect(x: 50, y: 450, width: 150, height: 40))
        deleteButton.setTitle("Delete", for: UIControlState.normal)
        deleteButton.backgroundColor = UIColor.brown
        deleteButton.addTarget(self, action:#selector(deleteDoneView), for: .touchUpInside)
        deleteView?.addSubview(deleteButton)
        
        let rdeleteButton: UIButton = UIButton(frame: CGRect(x: 250, y: 450, width: 150, height: 40))
        rdeleteButton.setTitle("Return", for: UIControlState.normal)
        rdeleteButton.backgroundColor = UIColor.brown
        rdeleteButton.addTarget(self, action:#selector(hideDeleteView), for: .touchUpInside)
        deleteView?.addSubview(rdeleteButton)
        
        return true
    }
    
    func deleteDoneView() {
        let name = dtextField?.text
        for i in curPurchase.items {
            if i.itemName == name {
                let item = curPurchase.items.filter {$0.itemName == name}
                curPurchase.items = curPurchase.items.filter {$0.itemName != name}
                store.items = store.items + item
                deleteView?.isHidden = true
                hideList()
                showList()
                return
            }
        }
        let alert = UIAlertView()
        alert.title = "Alert"
        alert.message = "No match item"
        alert.addButton(withTitle: "Understood")
        alert.show()
    }
    
    func showDeleteView() {
        deleteView?.isHidden = false
    }
    
    func hideDeleteView() {
        deleteView?.isHidden = true
    }
    
    func showSearchView() {
        searchView?.isHidden = false
    }
    
    func hideSearchView() {
        searchView?.isHidden = true
    }
    
    func showListView() {
//        var r = 0
//        for j in itemslistlist {
//            j.removeFromSuperview()
//        }
        var result: String = ""
        for i in curPurchase.items {
//            let rect: CGRect = CGRect(x:25,y:r,width:100,height:50)
//            let label: UILabel = UILabel(frame: rect)
//            label.text = i.itemName
//            listView?.addSubview(label)
//            itemslistlist.append(label)
//            r = r + 50
            result = result + "\n" + i.itemName
            listTextView?.text = result
        }
        listView?.isHidden = false
    }
    
    func hideListView() {
        listView?.isHidden = true
    }
    
    func showAddView() {
        addView?.isHidden = false
    }
    
    func hideAddView() {
        addView?.isHidden = true
    }
    
    func addDoneView() {
        let itemName = textField1?.text
        let itemPrice = textField2?.text
        let itemDescription = textField3?.text
        let itemStore = textField4?.text
        let itemCategory = textField5?.text
        var have = false
        var item: Item?
        for i in store.items {
            if itemName! == i.itemName && Int(itemPrice!)! == i.itemPrice && itemDescription! == i.itemDescription && itemStore == i.store.name && itemCategory == i.itemType.name{
                have = true
                item = i
            }
        }
        if have {
            store.items = store.items.filter {$0.itemName != itemName}
            curPurchase.items.append(item!)
            addView?.isHidden = true
            hideList()
            showList()
        }
        else {
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "No match item"
            alert.addButton(withTitle: "Understood")
            alert.show()
        }
        
    }
    
    func showSearchResultView() {
        let name = stextField?.text
//        for j in itemssearchlist {
//            j.removeFromSuperview()
//        }
        var result: String = ""
        for i in store.items {
            if i.itemName == name {
//                let srnrect: CGRect = CGRect(x:100,y:50,width:200,height:50)
//                let srnlabel: UILabel = UILabel(frame: srnrect)
//                srnlabel.text = "Item Name: " + i.itemName
//                srnlabel.font = UIFont.boldSystemFont(ofSize: 16.0)
//                searchView?.addSubview(srnlabel)
//                itemssearchlist.append(srnlabel)
                result = result + "Item Name: " + i.itemName + "\n"
//                let srprect: CGRect = CGRect(x:100,y:100,width:200,height:50)
//                let srplabel: UILabel = UILabel(frame: srprect)
//                srplabel.text = "Item Price: " + String(i.itemPrice)
//                srplabel.font = UIFont.boldSystemFont(ofSize: 16.0)
//                searchView?.addSubview(srplabel)
//                itemssearchlist.append(srplabel)
                result = result + "Item Price: " + String(i.itemPrice) + "\n"
//                let srdrect: CGRect = CGRect(x:100,y:150,width:200,height:50)
//                let srdlabel: UILabel = UILabel(frame: srdrect)
//                srdlabel.text = "Item Description: " + i.itemDescription
//                srdlabel.font = UIFont.boldSystemFont(ofSize: 16.0)
//                searchView?.addSubview(srdlabel)
//                itemssearchlist.append(srdlabel)
                result = result + "Item Description: " + i.itemDescription + "\n"
//                let srcrect: CGRect = CGRect(x:100,y:200,width:200,height:50)
//                let srclabel: UILabel = UILabel(frame: srcrect)
//                srclabel.text = "Item Category: " + i.itemType.name
//                srclabel.font = UIFont.boldSystemFont(ofSize: 16.0)
//                searchView?.addSubview(srclabel)
//                itemssearchlist.append(srclabel)
                result = result + "Item Category: " + i.itemType.name + "\n"
                searchTextView?.text = result
                return
            }
        }
        let alert = UIAlertView()
        alert.title = "Alert"
        alert.message = "No match item"
        alert.addButton(withTitle: "Understood")
        alert.show()
    }
    
    func showList() {
        var rm = 100
        for i in store.items {
            let nrect: CGRect = CGRect(x:25,y:rm,width:75,height:50)
            let nlabel: UILabel = UILabel(frame: nrect)
            nlabel.text = i.itemName
            itemslist.append(nlabel)
            mainView?.addSubview(nlabel)
            let prect: CGRect = CGRect(x:100,y:rm,width:50,height:50)
            let plabel: UILabel = UILabel(frame: prect)
            plabel.text = String(i.itemPrice)
            itemslist.append(plabel)
            mainView?.addSubview(plabel)
            let drect: CGRect = CGRect(x:150,y:rm,width:100,height:50)
            let dlabel: UILabel = UILabel(frame: drect)
            dlabel.text = i.itemDescription
            itemslist.append(dlabel)
            mainView?.addSubview(dlabel)
            let crect: CGRect = CGRect(x:300,y:rm,width:100,height:50)
            let clabel: UILabel = UILabel(frame: crect)
            clabel.text = i.itemType.name
            itemslist.append(clabel)
            mainView?.addSubview(clabel)
            
            rm = rm + 50
        }
    }
    
    func hideList() {
        for i in itemslist {
            i.removeFromSuperview()
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

