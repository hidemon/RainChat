//
//  AppDelegate.swift
//  RainChat
//
//  Created by mackbook on 15/7/28.
//  Copyright (c) 2015年 utaustin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RCIMUserInfoDataSource {

    var window: UIWindow?
    
    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        let userInfo = RCUserInfo()
        userInfo.userId = userId
        switch userId {
            case "sunyu":
            userInfo.name = "sunyu"
            userInfo.portraitUri = "http://file-www.sioe.cn/201109/14/222211817.jpg"
            case "yusun":
                userInfo.name = "yusun"
                userInfo.portraitUri = "http://img.store.sogou.com/net/a/05/link?appid=100520033&url=http%3A%2F%2Fwww.qqw21.com%2Farticle%2FUploadPic%2F2012-10%2F201210229441110298.jpg"
        default:
            println("No user")
        }
        return completion(userInfo)
    }
    
    func connectServer(completion: () -> Void) {
        //查询保存的token
        let tokenCache = NSUserDefaults.standardUserDefaults().objectForKey("kDeviceToken") as? String
        
        //初始化appkey
        RCIM.sharedRCIM().initWithAppKey("lmxuhwagx8yod")
        
        //用token测试连接
        RCIM.sharedRCIM().connectWithToken("fIcgVlDKgc579dkhe65jTQ/k4hX9PHaVuIHCIlqGdPb3aEX4sJWEMYJpDUTC98P2/gkYNoEYWfKTfXkTEM+ffw==", success: { (_) -> Void in
          
            
            let currentUser = RCUserInfo(userId: "sunyu", name: "sunyu", portrait: nil)
            RCIMClient.sharedRCIMClient().currentUserInfo = currentUser
            println("Connection Succeed1")
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
               completion()
            })
          
            
            }, error: { (_) -> Void in
                println("Failed")
            }) { () -> Void in
                println("Token is incorrect or invalid")
        }

        
    }
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //设置用户信息提供者为自己 AppDelegate
        RCIM.sharedRCIM().userInfoDataSource = self
        
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

