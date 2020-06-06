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
  
    let cheesedate = try! Realm().objects(Cheesedate.self)//.sorted(byKeyPath: "name")//名前順にする.sorted以降を
    var notificationToken:NotificationToken?    //tableviewを更新するために使う
    var detailArray:[String] = []//空箱作る。後でタッチしたセルの情報入れる

    override func viewDidLoad() {
        super.viewDidLoad()
        //テーブルビューのデータソースメソッドはVIewcontrollerに書く
        table.dataSource = self
        table.delegate = self
        //複数選択を可能にする。falseだと単一選択に
      //  table.allowsMultipleSelectionDuringEditing = true
        //編集ボタンの設定
       // navigationItem.rightBarButtonItem = editButtonItem
        //何にもないところには区切り線を表示しない
        table.tableFooterView = UIView()
        //cheesedataの中に新しいものがあると、tableviewが更新される
        notificationToken = cheesedate.observe{[weak self]_ in
            self?.table.reloadData()
        }
        
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
       table.isEditing = editing

    }

    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return cheesedate.count
    }
    //各セルの要素を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as! CheeseTableViewCell
        cell.nameLabel.text = cheesedate[indexPath.row].name
        cell.typeLabel.text = cheesedate[indexPath.row].type
        
        return cell
    }
    
    // segueが動作することをViewControllerに通知するメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueのIDを確認して特定のsegueのときのみ動作させる
        if segue.identifier == "toDetailViewController" {
            // 遷移先のViewControllerを取得
            let nextVC = segue.destination as? DetailViewController
            nextVC?.givenarray = detailArray
           }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print("\(indexPath.row)番目の行が選択されました。")
           //detailArrayの中に選択されたセルの中身を入れた
            detailArray.insert(cheesedate[indexPath.row].name, at:0)
            detailArray.insert(cheesedate[indexPath.row].type, at:1)
            detailArray.insert(cheesedate[indexPath.row].origin, at:2)
            detailArray.insert(cheesedate[indexPath.row].material, at:3)
            detailArray.insert(cheesedate[indexPath.row].looks, at:4)
            detailArray.insert(cheesedate[indexPath.row].taste, at:5)
            detailArray.insert(cheesedate[indexPath.row].memo, at:6)

           // セルの選択を解除
           tableView.deselectRow(at: indexPath, animated: true)
           // 別の画面に遷移
           performSegue(withIdentifier: "toDetailViewController", sender: nil)
       }
      //スワイプしたセルを削除　※arrayNameは変数名に変更してください
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      //   if editingStyle == UITableViewCell.EditingStyle.delete {
        try!realm.write{
            realm.delete(cheesedate[indexPath.row].self)
        }
      tableView.deleteRows(at: [indexPath], with: .automatic)
      }


    
 
    }

    //前のやつをコピってみた
    //func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      //     if editingStyle == .delete {
        //       cheesedate[indexPath.row].delete()
          //     cheesedate.remove(at: indexPath.row)
            //   tableView.deleteRows(at: [indexPath], with: .fade)
           //}
       //}
    






