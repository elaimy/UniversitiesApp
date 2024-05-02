//
//  AppDelegate.swift
//  UniversitiesApp
//
//  Created by Ahmed El-elaimy on 02/05/2024.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Realm.Configuration.defaultConfiguration = Realm.Configuration(
            schemaVersion: 1, // Increment this number whenever there's a schema change
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 1 {
                    // Perform migrations if needed, this block is empty if adding fields with default values
                    migration.enumerateObjects(ofType: UniversityRealm.className()) { oldObject, newObject in
                        // Assign a UUID for the new primary key field if it's newly added
                        newObject!["id"] = UUID().uuidString
                    }
                }
            })
        return true
    }

    // MARK: UISceneSession Lifecycle

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

