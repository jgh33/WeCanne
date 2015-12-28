//
//  AppDelegate.swift
//  WeCanne
//
//  Created by jgh on 15/12/21.
//  Copyright © 2015年 jgh. All rights reserved.
//

import UIKit

let GHKeyWindow = UIApplication.sharedApplication().keyWindow!

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let GHVersionKey = "version"

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        // 创建窗口
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        //获取当前版本号
        let currentVersion = NSBundle.mainBundle().infoDictionary!["CFBundleVersion"] as! String
//        获取上次的版本号
        let lastVersion = NSUserDefaults.standardUserDefaults().objectForKey(GHVersionKey) as? String
        //判断是否进入新特性页面
        if(currentVersion != lastVersion){
            let vc = GHCollectionViewController()
            self.window!.rootViewController = vc
            
            //偏好设置
            NSUserDefaults.standardUserDefaults().setObject(currentVersion, forKey: GHVersionKey)
        }else{
            // 创建tabBarVc
            let tabBarC = GHTabBarController()
            
            // 设置窗口的根控制器
            self.window!.rootViewController = tabBarC
        }
       
        // 显示窗口
        self.window?.makeKeyAndVisible()
        // makeKeyAndVisible底层实现
        // 1. application.keyWindow = self.window
        // 2. self.window.hidden = NO;

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

