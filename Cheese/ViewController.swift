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
    let cheesedate = try! Realm().objects(Cheesedate.self).sorted(byKeyPath: "name")//名前順にする.sorted以降を追加
    var notificationToken:NotificationToken?    //tableviewを更新するために使う

    override func viewDidLoad() {
        super.viewDidLoad()
        //テーブルビューのデータソースメソッドはVIewcontrollerに書く
        table.dataSource = self
        table.delegate = self
        //複数選択を可能にする。falseだと単一選択に
        table.allowsMultipleSelectionDuringEditing = true
        //編集ボタンの設定
        navigationItem.rightBarButtonItem = editButtonItem
        //何にもないところには区切り線を表示しない
        table.tableFooterView = UIView()
       // print(Realm.Configuration.defaultConfiguration.fileURL!)
        //cheesedataの中に新しいものがあると、tableviewが更新される
        notificationToken = cheesedate.observe{[weak self]_ in
            self?.table.reloadData()
        }
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        table.isEditing = editing

        print(editing)
    }
    
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return cheesedate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as! CheeseTableViewCell
        cell.nameLabel.text = cheesedate[indexPath.row].name
        cell.typeLabel.text = cheesedate[indexPath.row].type
        
        return cell
    }
    
    //セルの編集許可
    //func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
     //   return true
    //}

    //スワイプしたセルを削除　※arrayNameは変数名に変更してください
   // func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     //   if editingStyle == UITableViewCell.EditingStyle.delete {
       //     cheesedata.remove(at: indexPath.row)
         //   tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        //}
   // }




}

