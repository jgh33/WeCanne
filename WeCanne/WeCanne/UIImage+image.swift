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
    func imageWithOriginalName (name:String) -> UIImage{

        return UIImage(named: name)!.imageWithRenderingMode(.AlwaysOriginal)
    }
    
    func imageWithStretchableName (name:String) -> UIImage{
        let image = UIImage(named: name)!
        return image.resizableImageWithCapInsets(UIEdgeInsetsMake(10, 10, 10, 10))
//        (image.size.width * 0.5, topCapHeight: image.size.height * 0.5)
    }
}