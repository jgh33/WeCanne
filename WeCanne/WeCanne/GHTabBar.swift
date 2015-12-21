//
//  GHTabBar.swift
//  WeCanne
//
//  Created by jgh on 15/12/21.
//  Copyright © 2015年 jgh. All rights reserved.
//

import UIKit

protocol GHTabBarDelegate: NSObjectProtocol {
    func tabBar( tabBar: GHTabBar , didClickButton index:Int)
}


class GHTabBar: UIView {

    var items:NSMutableArray = [] {
        willSet{
            print("Will set an new value \(newValue) to items")
        }
        didSet{
            print("Did set an new value \(items) to items")
            // 遍历模型数组，创建对应tabBarButton
            for item in items{
                let btn = GHTabBarButton(type: .Custom)
                // 给按钮赋值模型，按钮的内容由模型对应决定
                btn.item = item as? UITabBarItem
                btn.tag = self.buttons.count
                btn.addTarget(self, action: "btnClick:", forControlEvents: .TouchDown)
                
                if (btn.tag == 0) { // 选中第0个
                    self.btnClick(btn)
                    
                }
                
                self.addSubview(btn)
                
                // 把按钮添加到按钮数组
                self.buttons.addObject(btn)
            }
        }
    }
    var delegate:GHTabBarDelegate!
    
    lazy var plusButton:UIButton = {
        
        let btn = UIButton(type: .Custom)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
        btn.setImage(UIImage(named: "tabbar_compose_background_icon_add"), forState: .Highlighted)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: .Highlighted)
        //默认调整大小
        btn.sizeToFit()
        
        self.addSubview(btn)
        
        return btn
        
    }()

    
    lazy var buttons:NSMutableArray = NSMutableArray()

    var selectedButton:UIButton = UIButton()
    
    // 点击tabBarButton调用
    func btnClick(button:UIButton){
        self.selectedButton.selected = false
        button.selected = true
        self.selectedButton = button
        
        // 通知tabBarVc切换控制器，
        if (self.delegate.respondsToSelector("tabBar:didClickButton:")){
        self.delegate.tabBar(self, didClickButton: button.tag)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let w:CGFloat = self.bounds.size.width
        let h:CGFloat = self.bounds.size.height
        var btnX:CGFloat = 0
        let btnY:CGFloat = 0
        let btnW:CGFloat = (w / CGFloat(self.items.count + 1))
        let btnH:CGFloat = self.bounds.size.height
        var i:CGFloat = 0
        for tabbarBtn in self.buttons{
            if i == 2{
                i = 3
            }
            btnX = i * btnW

            (tabbarBtn as! UIView).frame = CGRectMake(btnX, btnY, btnW, btnH)
            i++
        }

        
        self.plusButton.center = CGPointMake(w * 0.5, h * 0.5)
    }


}
