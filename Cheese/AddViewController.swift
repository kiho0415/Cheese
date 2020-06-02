//
//  AddViewController.swift
//  Cheese
//
//  Created by 森田貴帆 on 2020/05/23.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {
    
    @IBOutlet var cheeseImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nameTextfield: UITextField!
    
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var typeTextfield: UITextField!
    
    @IBOutlet var originLabel: UILabel!
    @IBOutlet var originTextfield: UITextField!
    
    @IBOutlet var materialLabel: UILabel!
    @IBOutlet var materialTextfield: UITextField!
    
    @IBOutlet var looksLabel: UILabel!
    @IBOutlet var looksTextfield: UITextField!

    @IBOutlet var tasteLabel: UILabel!
    @IBOutlet var tasteTextfield: UITextField!

    @IBOutlet var memoLabel: UILabel!
    @IBOutlet var memoTextview: UITextView!

    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(){
        let newcheesedate = Cheesedate()
        newcheesedate.name = nameTextfield.text!
        newcheesedate.type = typeTextfield.text!
        newcheesedate.origin = originTextfield.text!
        newcheesedate.material = materialTextfield.text!
        newcheesedate.looks = looksTextfield.text!
        newcheesedate.taste = tasteTextfield.text!
        newcheesedate.memo = memoTextview.text!
        
        //名前さえ登録してあればrealmに書き込む
        if newcheesedate.name == ""{
           let alert: UIAlertController = UIAlertController(title: "注意", message: "チーズの名前を登録してください", preferredStyle: .alert)
                      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in})
                      )
                      present(alert, animated: true, completion: nil)
        } else {
            try! realm.write(){
            realm.add(newcheesedate)
            }
            //アラートを表示
            let alert: UIAlertController = UIAlertController(title: "確認", message: "保存しました", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in})
            )
            present(alert, animated: true, completion: nil)
        }
        //save押されたらtextfieldの中の表示をクリアする。本当はok押したらにしたいところ
        nameTextfield.text = ""
        typeTextfield.text = ""
        originTextfield.text = ""
        materialTextfield.text = ""
        looksTextfield.text = ""
        tasteTextfield.text = ""
        memoTextview.text = ""
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
