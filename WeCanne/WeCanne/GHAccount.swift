//
//  GHAccount.swift
//  WeCanne
//
//  Created by jgh on 15/12/29.
//  Copyright © 2015年 jgh. All rights reserved.
//

import Foundation

class GHAccount : NSObject, NSCoding {
//宏定义key
    let GHRefreshTokenKey = "refresh_token"
    let GHAccountTokenKey = "access_token"
    let GHUIDKey = "uid"
    let GHExpiresInKey = "expires_in"
    
    var refresh_token: String?
    var app: AnyObject?
    var uid: String?
    var expires_in: String?{

        didSet{
            self.expires_date = NSDate(timeIntervalSinceNow: Double(expires_in!)!)
        }
    }
    var access_token:String?
    var remind_in: String?
    //date
    var expires_date:NSDate?

    init(dict: [NSObject:AnyObject]!){
        super.init()
        let dicts = dict as! [String:AnyObject]
        self.setValuesForKeysWithDictionary(dicts)
    }
//归档的时候调用
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.refresh_token, forKey: GHRefreshTokenKey)
        aCoder.encodeObject(self.access_token, forKey: GHAccountTokenKey)
        aCoder.encodeObject(self.uid, forKey: GHUIDKey)
        aCoder.encodeObject(self.expires_in, forKey: GHExpiresInKey)
    }
//
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.refresh_token = aDecoder.decodeObjectForKey(GHRefreshTokenKey) as? String
        self.access_token = aDecoder.decodeObjectForKey(GHAccountTokenKey) as? String
        self.uid = aDecoder.decodeObjectForKey(GHUIDKey) as? String
        self.expires_in = aDecoder.decodeObjectForKey(GHExpiresInKey) as? String
    }
}