//
//  AddViewController.swift
//  Cheese
//
//  Created by 森田貴帆 on 2020/05/23.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //pickerviewに表示する列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
    }
    //pickerviewに表示するデータの数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return 8
    }
    //titleForRowはpickerViewに設定するデータを登録するためのメソッド
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return typedata[row]
    }
    //didSelectRowはpickerViewの各種データを選択したときに呼ばれるメソッド
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           typeTextfield.text = typedata[row]
       }
    
    
    @IBOutlet var cheeseImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nameTextfield: UITextField!
    
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var typeTextfield: UITextField!
    var pickerView = UIPickerView()
    var typedata = ["フレッシュ","セミハード","ハード","白カビ","青カビ","ウォッシュ","シェーブル","プロセス"]
    
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
        createPickerView()
    }
    
    func createPickerView() {
        pickerView.delegate = self
        //UITextFieldが持つinputViewにpickerViewを設定=入力キーボードをpickerviewに変更
        typeTextfield.inputView = pickerView
        // toolbarを設定
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddViewController.donePicker))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(AddViewController.cancelPicker))
        toolbar.setItems([cancelItem,doneItem], animated: true)
        typeTextfield.inputAccessoryView = toolbar
    }
    //toolbar上のボタンを押した時にイーボードを非表示にする
    @objc func donePicker() {
        typeTextfield.endEditing(true)
    }
    @objc func cancelPicker() {
        typeTextfield.endEditing(true)
        typeTextfield.text = ""
    }
   //キーボード以外の場所をタップしたときにキーボードを非表示
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        typeTextfield.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
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
