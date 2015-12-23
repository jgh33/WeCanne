//
//  UIBarButtonItem+Item.swift
//  WeCanne
//
//  Created by jgh on 15/12/21.
//  Copyright © 2015年 jgh. All rights reserved.
//

import Foundation
import UIKit


extension UIBarButtonItem{
    class func barButtonItemWithImage(image:UIImage,highImage:UIImage,target:AnyObject?,action:Selector ,controlEvents:UIControlEvents) -> UIBarButtonItem {
                let btn = UIButton(type: .Custom)
            btn.setBackgroundImage(image, forState: .Normal)
            btn.setBackgroundImage(highImage, forState: .Highlighted)
            btn.sizeToFit()
            btn.addTarget(target, action: action, forControlEvents: controlEvents)
            
            return UIBarButtonItem(customView: btn)


    }
}