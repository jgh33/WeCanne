//
//  AccountTool.swift
//  WeCanne
//
//  Created by jgh on 15/12/29.
//  Copyright © 2015年 jgh. All rights reserved.
//专门处理账户的信息存储／读取

import Foundation

let GHAccountFile = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] + "account.data"

class AccountTool {
    static var account:GHAccount? = {
        get{
            
        }
        let account = NSKeyedUnarchiver.unarchiveObjectWithFile(GHAccountFile) as! GHAccount
        if(NSDate().compare(self.account)){
            
        }
        return account
    }()
    
    class func saveAccount(account:GHAccount){
        NSKeyedArchiver.archiveRootObject(account, toFile: GHAccountFile)
    }

    


}