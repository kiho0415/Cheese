//
//  DetailViewController.swift
//  Cheese
//
//  Created by 森田貴帆 on 2020/06/02.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit
//import RealmSwift


class DetailViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var looksLabel: UILabel!
    @IBOutlet weak var tasteLabel: UILabel!
    @IBOutlet weak var mamoTextView: UITextView!
    
    //var givenarray = [String](repeating: "l", count: 5/*必要な要素数*/)
    var givenarray:[String]? = []
    //let realm = try! Realm()
    //保存されている全オブジェクトを取得
   // let cheesedate = try! Realm().objects(Cheesedate.self)
    
   // override func viewDidAppear(_ animated: Bool){
     //   super.viewDidAppear(animated)
       // print(givenarray!)
    //
//}
    
    override func loadView() {
        super.loadView()
        print(givenarray!)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
       //  print(cheesedate)
        
        nameLabel.text = givenarray![0]
        //typeLabel.text = givenarray[1]
        //originLabel.text = givenarray[2]
        //looksLabel.text = givenarray[3]
        //tasteLabel.text = givenarray[4]
        //mamoTextView.text = givenarray[5]

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
