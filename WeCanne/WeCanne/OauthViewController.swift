//
//  OauthViewController.swift
//  WeCanne
//
//  Created by jgh on 15/12/28.
//  Copyright © 2015年 jgh. All rights reserved.
//

import UIKit

class OauthViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        oauths()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func oauths(){
        let qurest:WBAuthorizeRequest! = WBAuthorizeRequest.request() as! WBAuthorizeRequest
        qurest.redirectURI = kRedirectURI
        qurest.scope = "all"
        WeiboSDK.sendRequest(qurest)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
