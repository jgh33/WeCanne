//
//  GHCover.swift
//  WeCanne
//
//  Created by jgh on 15/12/21.
//  Copyright © 2015年 jgh. All rights reserved.
//

import UIKit


@objc protocol GHCoverDelegate: NSObjectProtocol{
    // 点击蒙板的时候调用
    optional func coverDidClickCover(cover:GHCover)
}
class GHCover: UIView {
    
    var dimBackground = false{
        willSet{
            
        }
        didSet{
            // 设置浅灰色蒙板

            if dimBackground{
                self.backgroundColor = UIColor.blackColor()
                self.alpha = 0.5
            }else{
                self.alpha = 1
                self.backgroundColor = UIColor.clearColor()
            }
        }
    }
    var delegate:GHCoverDelegate?
    
    /**
    *  显示蒙板
    */
    init(){
        super.init(frame:UIScreen.mainScreen().bounds)
        self.backgroundColor = UIColor.clearColor()
        GHKeyWindow.addSubview(self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   // 点击蒙板的时候做事情
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 移除蒙板
        self.removeFromSuperview()
        
        // 通知代理移除菜单
//        if(self.delegate.respondsToSelector("coverDidClickCover:")){
            self.delegate?.coverDidClickCover!(self)
//        }
    }
//    func coverDidClickCover(cover:GHCover){
//        
//    }
    
    
    

}
