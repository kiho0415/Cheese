//
//  Cheesedate.swift
//  Cheese
//
//  Created by 森田貴帆 on 2020/05/31.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import Foundation
import RealmSwift

class Cheesedate: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var origin: String = ""
    @objc dynamic var material: String = ""
    @objc dynamic var looks: String = ""
    @objc dynamic var taste: String = ""
    @objc dynamic var memo: String = ""
    
    func  remove() {
        try! realm!.write {
            realm!.delete(self)
        }
           
    }
}
