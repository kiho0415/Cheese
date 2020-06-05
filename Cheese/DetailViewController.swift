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
    @IBOutlet weak var looksLabel: UILabel!
    @IBOutlet weak var tasteLabel: UILabel!
    @IBOutlet weak var memoTextView: UITextView!
    
    var givenarray:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = givenarray[0]
        typeLabel.text = givenarray[1]
        originLabel.text = givenarray[2]
        materialLabel.text = givenarray[3]
        looksLabel.text = givenarray[4]
        tasteLabel.text = givenarray[5]
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
