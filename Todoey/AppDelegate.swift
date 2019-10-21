//
//  AppDelegate.swift
//  Todoey
//
//  Created by Romaha  on 10/16/19.
//  Copyright © 2019 Romaha . All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    //    print(Realm.Configuration.defaultConfiguration.fileURL)
       
        do {
            let realm =  try Realm()
        } catch {
            print("Error initialing new Realm, \(error)")
        }
        return true
    }
}

