//
//  GHPopMenu.swift
//  WeCanne
//
//  Created by jgh on 15/12/21.
//  Copyright © 2015年 jgh. All rights reserved.
//

import UIKit

class GHPopMenu: UIImageView {
    
    var contentView:UIView {
        willSet{
            self.contentView.removeFromSuperview()
        }
        didSet{
            contentView.backgroundColor = UIColor.clearColor()
            self.addSubview(contentView)
        }
    }

    init(showInRect rect:CGRect){
        self.contentView = UIView()
        super.init(frame: rect)
        self.userInteractionEnabled = true
        self.image = UIImage.imageWithStretchableName("popover_background")
        GHKeyWindow.addSubview(self)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func hide(){
        for popM in GHKeyWindow.subviews {
            if popM.isKindOfClass(self){
                popM .removeFromSuperview()
            }
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let y:CGFloat = 9
        let margin:CGFloat = 5
        let x:CGFloat = margin
        let w:CGFloat = self.width! - 2 * margin
        let h:CGFloat = self.height! - y - margin
        self.contentView.frame = CGRectMake(x, y, w, h)
    }
   }
