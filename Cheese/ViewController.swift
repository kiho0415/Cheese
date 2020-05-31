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

    override func viewDidLoad() {
        super.viewDidLoad()
        //テーブルビューのデータソースメソッドはVIewcontrollerに書く
        table.dataSource = self
    }
    
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
    //ID付きCellを取得してセル付属のtextlabelにテストと表示させておくとりあえず
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = "test"
        
        return cell!
    }


}

