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
    convenience init(image:UIImage?,
        highImage:UIImage,
        target:AnyObject?,
        action:Selector,
        controlEvents: UIControlEvents) {
            let btn = UIButton(type: .Custom)
            btn.setBackgroundImage(image, forState: .Normal)
            btn.setBackgroundImage(highImage, forState: .Highlighted)
            btn.sizeToFit()
            btn.addTarget(target, action: action, forControlEvents: controlEvents)
            self.init(customView:btn)

    }
}