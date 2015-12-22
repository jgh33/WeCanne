//
//  GHTabBarButton.swift
//  WeCanne
//
//  Created by jgh on 15/12/21.
//  Copyright © 2015年 jgh. All rights reserved.
//

import UIKit

class GHTabBarButton: UIButton {
    
    let GHImageRidio = 0.7
    var item:UITabBarItem? {
        
        willSet(newValue){
        }
        didSet{

            self.observeValueForKeyPath(nil, ofObject: nil, change: nil, context: nil)
            
            // KVO：时刻监听一个对象的属性有没有改变
            // 给谁添加观察者
            // Observer:按钮
            item!.addObserver(self, forKeyPath: "title", options: .New, context: nil)
            item!.addObserver(self, forKeyPath: "image", options: .New, context: nil)
            item!.addObserver(self, forKeyPath: "selectedImage", options: .New, context: nil)
            item!.addObserver(self, forKeyPath: "badgeValue", options: .New, context: nil)
            
        }
    }
    
    lazy var badgeView:GHBadgeView = {
        let btn = GHBadgeView(type: .Custom)
        
        self.addSubview(btn)
        return btn

    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.setTitleColor(UIColor.orangeColor(), forState: .Selected)
        
        //图片居中
        self.imageView?.contentMode = .Center
        self.titleLabel?.textAlignment = .Center
        self.titleLabel?.font = UIFont.systemFontOfSize(12)
    }
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func sFrame(frame:CGRect) -> GHTabBarButton{
//        let btn = GHTabBarButton(frame: frame)
//        //设置颜色
//        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
//        btn.setTitleColor(UIColor.orangeColor(), forState: .Selected)
//        
//        //图片居中
//        btn.imageView?.contentMode = .Center
//        btn.titleLabel?.textAlignment = .Center
//        btn.titleLabel?.font = UIFont.systemFontOfSize(12)
//        return btn
//    }
    
    // 只要监听的属性一有新值，就会调用
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        self.setTitle(self.item?.title, forState: .Normal)
        self.setImage(self.item?.image, forState: .Normal)
        self.setImage(self.item?.selectedImage, forState: .Selected)
        
        // 设置badgeValue
        if self.item!.badgeValue == nil{
            self.badgeView.badgeValue = ""
        }else{
            self.badgeView.badgeValue = self.item!.badgeValue!
        }
    }
    
    // 修改按钮内部子控件的frame
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 1.imageView
        let imageX:CGFloat = 0;
        let imageY:CGFloat = 0;
        let imageW = self.bounds.size.width;
        let imageH = self.bounds.size.height * CGFloat(GHImageRidio);
        self.imageView!.frame = CGRectMake(imageX, imageY, imageW, imageH);
        
        
        // 2.title
        let titleX:CGFloat = 0;
        let titleY = imageH - 3;
        let titleW = self.bounds.size.width;
        let titleH = self.bounds.size.height - titleY;
        self.titleLabel!.frame = CGRectMake(titleX, titleY, titleW, titleH);
        
        // 3.badgeView
        self.badgeView.x = self.width! - self.badgeView.width! - 10;
        self.badgeView.y = 0;

    }
    
    

   
}
