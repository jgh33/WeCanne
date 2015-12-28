//
//  GHCollectionViewCell.swift
//  WeCanne
//
//  Created by jgh on 15/12/26.
//  Copyright © 2015年 jgh. All rights reserved.
//

import UIKit

class GHCollectionViewCell: UICollectionViewCell {

    var image:UIImage?{
        
        didSet{
            self.imageView.image = image
        }
    }

    
    lazy var imageView:UIImageView = {

        
            let view = UIImageView()
            self.contentView.addSubview(view)
            print("jiazai")
            return view
       
    }()
    
    
    lazy var shareButton:UIButton = {
        let btn = UIButton(type: .Custom)
        btn.setTitle("分享给大家", forState:.Normal)
        btn.setImage(UIImage(named: "new_feature_share_false"), forState: .Normal)
        btn.setImage(UIImage(named: "new_feature_share_true"), forState: .Selected)
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn.sizeToFit()
        self.contentView.addSubview(btn)
        return btn
    }()
    
    
    lazy var startButton:UIButton = {
        let btn = UIButton(type: .Custom)
        btn.setTitle("开始微博", forState:.Normal)
        btn.setBackgroundImage(UIImage(named: "new_feature_finish_button"), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "new_feature_finish_button_highlighted"), forState: .Highlighted)
        btn.sizeToFit()
        btn.addTarget(self, action: "start", forControlEvents: .TouchUpInside)
        self.contentView.addSubview(btn)
        return btn
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView.frame = self.bounds
        
        //shareBtn
        self.shareButton.center = CGPointMake(self.width! * 0.5, self.height! * 0.8)
        //startBtn
        self.startButton.center = CGPointMake(self.width! * 0.5, self.height! * 0.9)
    }
    
    // 判断当前cell是否是最后一页
    func setIndexPath(indexPath:NSIndexPath , count:Int){
        if(indexPath.row == count - 1){
            self.shareButton.hidden = false
            self.startButton.hidden  = false
        }else{
            self.shareButton.hidden = true
            self.startButton.hidden  = true
        }
    }
    
    // 点击开始微博的时候调用
    func start(){
        // 进入tabBarVc
        let tabbarC = GHTabBarController()
        // 切换根控制器:可以直接把之前的根控制器清空
        GHKeyWindow.rootViewController = tabbarC

    }
    


}
