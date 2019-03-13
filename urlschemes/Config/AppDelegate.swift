//
//  AppDelegate.swift
//  urlschemes
//
//  Created by IRFAN TRIHANDOKO on 12/03/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var deepLinkData: DeepLinkModel?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        if application.userActivity?.activityType == NSUserActivityTypeBrowsingWeb {
            let url = application.userActivity?.webpageURL!
            self.handleUrl(url: url!)
        }
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // Mark: - Handle URL Schemes
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (url.scheme == "deep-link") {
            self.handleUrl(url: url)
        }
        return false
    }
    
}

// Mark: - Handle URL Scheme 
extension AppDelegate {
    
    func handleUrl(url: URL) {
        var parameters: [String: String] = [:]
        // Handle url and open whatever page you want to open.
        URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.forEach {
            parameters[$0.name] = $0.value
        }
        let type = url.path.replacingOccurrences(of: "/", with: "")
        // Convert url data to be model
        self.deepLinkData = DeepLinkModel(type: type, id: parameters["id"], categoryId: parameters["categoryId"])
        self.handleDeepLink(data: self.deepLinkData ?? DeepLinkModel(type: "", id: "", categoryId: ""))
    }
    
    func handleDeepLink(data: DeepLinkModel) {
        let story = UIStoryboard(name: "DeepLink", bundle: nil)
        let nav = story.instantiateInitialViewController() as? UINavigationController
        let vc = nav?.topViewController as! DeepLinkVC
        vc.data = data
        vc.originRoot = self.window?.rootViewController
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
    }
}

