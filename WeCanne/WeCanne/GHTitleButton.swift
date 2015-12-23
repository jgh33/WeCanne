//
//  GHTitleButton.swift
//  WeCanne
//
//  Created by jgh on 15/12/21.
//  Copyright © 2015年 jgh. All rights reserved.
//

import UIKit

class GHTitleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.setBackgroundImage(UIImage.imageWithStretchableName("navigationbar_filter_background_highlighted"), forState: .Highlighted)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if( self.currentImage == nil){
            return
        }
        self.titleLabel!.x = self.imageView?.x
        self.imageView!.x = CGRectGetMaxX(self.titleLabel!.frame)
    }
    
    override func setTitle(title: String?, forState state: UIControlState) {
        super.setTitle(title, forState: state)
        self.sizeToFit()
    }
    
    override func setImage(image: UIImage?, forState state: UIControlState) {
        super.setImage(image, forState: state)
        self.sizeToFit()
    }
    



}
