//
//  ViewController.swift
//  Cheese
//
//  Created by 森田貴帆 on 2020/05/18.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
  
    
    let realm = try! Realm()
    let cheesedate = try! Realm().objects(Cheesedate.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        //テーブルビューのデータソースメソッドはVIewcontrollerに書く
        table.dataSource = self
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return cheesedate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as! CheeseTableViewCell
        cell.nameLabel.text = cheesedate[indexPath.row].name
        
        return cell
    }


}

