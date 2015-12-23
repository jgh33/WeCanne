//
//  GHSearchBar.swift
//  WeCanne
//
//  Created by jgh on 15/12/21.
//  Copyright © 2015年 jgh. All rights reserved.
//

import UIKit

class GHSearchBar: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.font = UIFont.systemFontOfSize(13)
        self.background = UIImage.imageWithStretchableName("searchbar_textfield_background")
        
        let imageV = UIImageView(image: UIImage(named: "searchbar_textfield_search_icon"))
        imageV.width = imageV.width! + 10
        imageV.contentMode = .Center
        self.leftView = imageV
        self.leftViewMode = .Always
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
