//
//  UIImage+image.swift
//  WeCanne
//
//  Created by jgh on 15/12/21.
//  Copyright © 2015年 jgh. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    class func imageWithOriginalName (name:String) -> UIImage{

        return UIImage(named: name)!.imageWithRenderingMode(.AlwaysOriginal)
    }
    
    class func imageWithStretchableName (name:String) -> UIImage{
        let image = UIImage(named: name)!
        return image.resizableImageWithCapInsets(UIEdgeInsetsMake(image.size.height * 0.5, image.size.width * 0.5, 10, 10))
//        (image.size.width * 0.5, topCapHeight: image.size.height * 0.5)
    }
}