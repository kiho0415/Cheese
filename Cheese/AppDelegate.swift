//
//  AppDelegate.swift
//  Cheese
//
//  Created by 森田貴帆 on 2020/05/18.
//  Copyright © 2020 森田貴帆. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        changeNavigationBarColor()
        return true
    }

    // MARK: UISceneSession Lifecycle
    
   func changeNavigationBarColor() {
        //全てのNavigation Barの色を変更する
        //Navigation Bar の背景色の変更
        UINavigationBar.appearance().barTintColor = CheeseColor.primary
        //Navigation Bar の文字色の変更
       UINavigationBar.appearance().tintColor = CheeseColor.secondary
       //  Navigation Bar のタイトルの文字色の変更
      UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: CheeseColor.background]
    }
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

