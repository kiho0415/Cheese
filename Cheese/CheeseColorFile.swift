//
//  CheeseColorFile.swift
//  Cheese
//
//  Created by 森田貴帆 on 2020/06/12.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import Foundation
import UIKit

class CheeseColor {
    // チーズ色を返す
    class var primary: UIColor {
        return rgbColor(rgbValue: 0xFACB06)
    }

    // 濃いオレンジを返す
    class var secondary: UIColor{
        return rgbColor(rgbValue: 0xEF7937)
    }

    // 白っぽい灰色を返す
    class var background: UIColor{
        return rgbColor(rgbValue: 0xFFFFFF)
    }

    //#FFFFFFのように色を指定できるようにするメソッド！色が使いやすくなる。
    // ここでしか使わないので privateメソッドにする。
    private class func rgbColor(rgbValue: UInt) -> UIColor{
        return UIColor(
            red:   CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >>  8) / 255.0,
            blue:  CGFloat( rgbValue & 0x0000FF)        / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
