//
//  YellowTabBarController.swift
//  Cheese
//
//  Created by 森田貴帆 on 2020/06/10.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit

class YellowTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // アイコンの色を変更できます！
        UITabBar.appearance().tintColor = CheeseColor.secondary
        // 背景色を変更できます！
        UITabBar.appearance().barTintColor = CheeseColor.primary
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
