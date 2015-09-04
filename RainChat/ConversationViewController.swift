//
//  ConversationViewController.swift
//  RainChat
//
//  Created by mackbook on 15/7/28.
//  Copyright (c) 2015年 utaustin. All rights reserved.
//

import UIKit

class ConversationViewController: RCConversationViewController {
   
    override func viewDidAppear(animated: Bool) {
//         println("ss")
//         self.targetId = RCIMClient.sharedRCIMClient().currentUserInfo?.userId
//         self.userName = RCIMClient.sharedRCIMClient().currentUserInfo?.name
//         self.conversationType = RCConversationType.ConversationType_PRIVATE
//         self.title = self.userName
    }
           
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setMessageAvatarStyle(RCUserAvatarStyle._USER_AVATAR_CYCLE)
        println("viewdidload")
       
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
