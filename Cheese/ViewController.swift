//
//  ViewController.swift
//  Cheese
//
//  Created by 森田貴帆 on 2020/05/18.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate{
    
    @IBOutlet var table: UITableView!
  
    
    let realm = try! Realm()
    let cheesedate = try! Realm().objects(Cheesedate.self)
    var notificationToken:NotificationToken?    //tableviewを更新するために使う

    override func viewDidLoad() {
        super.viewDidLoad()
        //テーブルビューのデータソースメソッドはVIewcontrollerに書く
        table.dataSource = self
        table.delegate = self
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        //cheesedataの中に新しいものがあると、tableviewが更新される
        notificationToken = cheesedate.observe{[weak self]_ in
            self?.table.reloadData()
        }
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

