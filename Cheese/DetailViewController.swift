//
//  DetailViewController.swift
//  Cheese
//
//  Created by 森田貴帆 on 2020/06/02.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit
import RealmSwift


class DetailViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var looksLabel: UILabel!
    @IBOutlet weak var tasteLabel: UILabel!
    @IBOutlet weak var mamoTextView: UITextView!
    
    let realm = try! Realm()
    //保存されている全オブジェクトを取得
    let cheesedate = try! Realm().objects(Cheesedate.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // nameLabel.text = cheesedate.name

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
