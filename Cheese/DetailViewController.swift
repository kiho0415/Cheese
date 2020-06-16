//
//  DetailViewController.swift
//  Cheese
//
//  Created by 森田貴帆 on 2020/06/02.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit



class DetailViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var materialLabel: UILabel!
    @IBOutlet weak var looksTextView: UITextView!
    @IBOutlet weak var tasteTextView: UITextView!
    @IBOutlet weak var memoTextView: UITextView!
    
    var givenarray:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
       // self.navigationController!.navigationBar.barStyle = .black
        //self.navigationController!.navigationBar.barTintColor = #colorLiteral(red: 0.1725490196, green: 0.1725490196, blue: 0.1725490196, alpha: 1)
        //self.navigationController!.navigationBar.tintColor = .white
        //self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.looksTextView.isEditable = false
        self.looksTextView.isSelectable = false
        self.tasteTextView.isEditable = false
        self.tasteTextView.isSelectable = false
        self.memoTextView.isEditable = false
        self.memoTextView.isSelectable = false
        nameLabel.text = givenarray[0]
        typeLabel.text = givenarray[1]
        originLabel.text = givenarray[2]
        materialLabel.text = givenarray[3]
        looksTextView.text = givenarray[4]
        tasteTextView.text = givenarray[5]
        memoTextView.text = givenarray[6]

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
