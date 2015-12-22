//
//  GHBadgeView.swift
//  WeCanne
//
//  Created by jgh on 15/12/21.
//  Copyright © 2015年 jgh. All rights reserved.
//

import UIKit

class GHBadgeView: UIButton {
    
    let GHBadgeViewFont = UIFont.systemFontOfSize(11 as CGFloat)
    
    var badgeValue:NSString{
        willSet{
            if ( newValue.length == 0 || newValue == "0"){
                self.hidden = true
            }else{
                self.hidden = false
            }
            let size:CGSize = newValue.sizeWithAttributes([UIFontTextStyleBody:GHBadgeViewFont])
            if(size.width > self.width){
                self.setImage(UIImage(named: "new_dot"), forState: .Normal)
                self.setTitle(nil, forState: .Normal)
                self.setBackgroundImage(nil, forState: .Normal)
            }else{
                self.setImage(UIImage(named: "main_badge"), forState: .Normal)
                self.setTitle(newValue as String, forState: .Normal)
                self.setBackgroundImage(nil, forState: .Normal)
            }

            
        }
       
        didSet{
//            
//            if ( badgeValue.length == 0 || badgeValue == "0"){
//                self.hidden = true
//            }else{
//                self.hidden = false
//            }
//            let size:CGSize = badgeValue.sizeWithAttributes([UIFontTextStyleBody:GHBadgeViewFont])
//            if(size.width > self.width){
//                self.setImage(UIImage(named: "new_dot"), forState: .Normal)
//                self.setTitle(nil, forState: .Normal)
//                self.setBackgroundImage(nil, forState: .Normal)
//            }else{
//                self.setImage(UIImage(named: "main_badge"), forState: .Normal)
//                self.setTitle(badgeValue as String, forState: .Normal)
//                self.setBackgroundImage(nil, forState: .Normal)
//            }
        }
    }
    
    
    override init(frame: CGRect){
        self.badgeValue = "0"
        super.init(frame: frame)
        self.userInteractionEnabled = false
        self.setBackgroundImage(UIImage(named: "main_badge"), forState: .Normal)
        self.titleLabel?.font = GHBadgeViewFont
        self.sizeToFit()
        

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    - (instancetype)initWithFrame:(CGRect)frame
//    {
//    if (self = [super initWithFrame:frame]) {
//    
//    self.userInteractionEnabled = NO;
//    
//    [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
//    
//    // 设置字体大小
//    self.titleLabel.font = CZBadgeViewFont;
//    
//    [self sizeToFit];
//    
//    }
//    return self;
//    }




}
