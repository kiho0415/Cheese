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
    

}
