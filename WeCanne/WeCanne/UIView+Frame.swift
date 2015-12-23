//
//  UIView+Frame.swift
//  WeCanne
//
//  Created by jgh on 15/12/21.
//  Copyright © 2015年 jgh. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    var x:CGFloat?{
        get{
            return self.frame.origin.x
        }
        set{
            var frames = self.frame
            frames.origin.x = x!
            self.frame = frames
        }
    }
    var y:CGFloat?{
        get{
            return self.frame.origin.y
        }
        set{
            var frames = self.frame
            frames.origin.x = y!
            self.frame = frames
        }
    }
    var width:CGFloat?{
        get{
            return self.frame.size.width
        }
        set{
            var frames = self.frame
            frames.size.width = width!
            self.frame = frames
            
        }
    }
    var height:CGFloat?{
        get{
            return self.frame.size.height
        }
        set{
            var frames = self.frame
            frames.size.width = height!
            self.frame = frames
            
        }

    }
    
    
    


}