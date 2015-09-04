//
//  ConversationListViewController.swift
//  RainChat
//
//  Created by mackbook on 15/7/29.
//  Copyright (c) 2015年 utaustin. All rights reserved.
//

import UIKit

class ConversationListViewController: RCConversationListViewController {
    @IBAction func ShowMenu(sender: UIBarButtonItem) {
//        var frame = sender.valueForKey("view")?.frame
//        frame?.origin.y += 30
//        KxMenu.showMenuInView(self.view, fromRect: frame!, menuItems: [KxMenuItem("kefu", image: nil, target:self,action: "ClickMenu1")])
        let items = [
            MenuItem(title: "客服", iconName: "sevice", glowColor: UIColor.redColor(), index: 0),
            MenuItem(title: "对话", iconName: "conversation", glowColor: UIColor.blueColor(), index: 1),
            MenuItem(title: "通讯录", iconName: "contact", glowColor: UIColor.yellowColor(), index: 2)
         
        ]
        
        let menu = PopMenu(frame: self.view.bounds, items: items)
        menu.menuAnimationType = .NetEase
        
        if(menu.isShowed) {
            return
        }
        
        menu.didSelectedItemCompletion = { (selectedItem: MenuItem!) -> Void in
            
            
            switch selectedItem.index {
            case 1:
                let conversation = ConversationViewController()
                conversation.targetId = "sunyu"
                conversation.userName = "sunyu"
                conversation.conversationType = RCConversationType.ConversationType_PRIVATE
                conversation.title = conversation.userName
                
                self.navigationController?.pushViewController(conversation, animated: true)
                self.tabBarController?.tabBar.hidden = true
            default: println(selectedItem.index)
            }
        }
        
        menu.showMenuAtView(self.view)
     
    }
    
    let conversation = ConversationViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        appDelegate?.connectServer({ () -> Void in
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_APPSERVICE.rawValue,
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue
                ])
            self.refreshConversationTableViewIfNeeded()
        })
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destVC = segue.destinationViewController as? RCConversationViewController
        destVC?.targetId = conversation.targetId
        destVC?.userName = conversation.userName
        destVC?.conversationType = conversation.conversationType
        destVC?.title = conversation.title
        self.tabBarController?.tabBar.hidden = true
        
    }
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
    
        conversation.targetId = model.targetId
        conversation.userName = model.conversationTitle
        conversation.conversationType = model.conversationType
        conversation.title = model.conversationTitle
        println("Selected")
        self.performSegueWithIdentifier("tapOnCell", sender: self)
//        self.navigationController?.pushViewController(conversation, animated: true)
//        self.tabBarController?.tabBar.hidden = true
    }
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
}
