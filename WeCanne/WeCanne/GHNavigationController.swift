//
//  GHNavigationController.swift
//  WeCanne
//
//  Created by jgh on 15/12/21.
//  Copyright © 2015年 jgh. All rights reserved.
//

import UIKit

class GHNavigationController: UINavigationController ,UINavigationControllerDelegate{
    var popDelegate:AnyObject?
    
    override class func initialize(){
        // 获取当前类下面的UIBarButtonItem
        let item = UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([self])
        
        // 设置导航条按钮的文字颜色
        let titleAttr = [NSForegroundColorAttributeName: UIColor.orangeColor()]
        item.setTitleTextAttributes(titleAttr, forState: .Normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.popDelegate = self.interactivePopGestureRecognizer?.delegate
               // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        //设置非根控制器的导航条
        if self.viewControllers.count != 0{
            //设置导航条左右
            //如何导航条的返回按钮覆盖，就不能滑动返回了
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.barButtonItemWithImage(UIImage(named: "navigationbar_back")!, highImage: UIImage(named: "navigationbar_back_highlighted")!, target: self, action: "backToPre", controlEvents: .TouchUpInside)
            viewController.navigationItem.rightBarButtonItem = UIBarButtonItem.barButtonItemWithImage(UIImage(named: "navigationbar_more")!, highImage: UIImage(named: "navigationbar_more_highlighted")!, target: self, action: "backToRoot", controlEvents: .TouchUpInside)
        }
        
        super.pushViewController(viewController, animated: animated)

    }
    
    func backToPre(){
        self.popViewControllerAnimated(true)
    }
    func backToRoot(){
        self.popToRootViewControllerAnimated(true)
    }
    
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        if (viewController == self.viewControllers[0]) {
            
            self.interactivePopGestureRecognizer?.delegate = self.popDelegate! as? UIGestureRecognizerDelegate
//            print("add")
            
        }else{
            //实现滑动返回手势
            //清空滑动返回手势代理，就能实现滑动功能(回到根控制器要还原)
            self.interactivePopGestureRecognizer?.delegate = nil
//            print("delete")
        }    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
