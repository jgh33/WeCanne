//
//  GHTabBarController.swift
//  WeCanne
//
//  Created by jgh on 15/12/21.
//  Copyright © 2015年 jgh. All rights reserved.
//

import UIKit

class GHTabBarController: UITabBarController ,GHTabBarDelegate{
    
    lazy var items:NSMutableArray = NSMutableArray()

    
    var home:GHHomeViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createAllChildViewController()
        setUpTabBar()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //移除系统的tabbar的item
        for tabbarBtn in self.tabBar.subviews{
            if tabbarBtn.isKindOfClass(NSClassFromString("UITabBarButton")!){
                tabbarBtn.removeFromSuperview()
            }
        }
    }
    
//MARK: - 设置tabBar
    func setUpTabBar()
    {
    // 自定义tabBar
        let tabBar = GHTabBar(frame:self.tabBar.bounds)
    tabBar.backgroundColor = UIColor.whiteColor()
    // 设置代理
    tabBar.delegate = self;
    
    // 给tabBar传递tabBarItem模型
    tabBar.items = self.items;
    
    // 添加自定义tabBar
    self.tabBar.addSubview(tabBar)
    
//    // 移除系统的tabBar
//    self.tabBar.removeFromSuperview()
    }
    
//MARK: - 当点击tabBar上的按钮调用
    func tabBar(tabBar: GHTabBar, didClickButton index: Int) {
        self.selectedIndex = index
    }


    func createAllChildViewController(){
        //管理子控制器
        
        //home
        let homeC = GHHomeViewController()
        setUpOneChildViewController(homeC, title: "首页", image: UIImage(named: "tabbar_home")!, selectedImage: UIImage(named: "tabbar_home_selected")!.imageWithRenderingMode(.AlwaysOriginal))
        self.home = homeC
        //message
        let message = GHMessageViewController()
        setUpOneChildViewController(message, title: "消息", image: UIImage(named: "tabbar_message_center")!, selectedImage: UIImage(named: "tabbar_message_center_selected")!.imageWithRenderingMode(.AlwaysOriginal))
        //discover
        let discover = GHDiscoverViewController()
        setUpOneChildViewController(discover, title: "发现", image: UIImage(named: "tabbar_discover")!, selectedImage: UIImage(named: "tabbar_discover_selected")!.imageWithRenderingMode(.AlwaysOriginal))
        //profile
        let profile = GHProfileViewController()
        setUpOneChildViewController(profile, title: "我", image: UIImage(named: "tabbar_profile")!, selectedImage: UIImage(named: "tabbar_profile_selected")!.imageWithRenderingMode(.AlwaysOriginal))
        
    }
//MARK: - 添加一个子控制器
    func setUpOneChildViewController(vc:UIViewController ,title:String ,image:UIImage ,selectedImage:UIImage){
        vc.title = title
        vc.tabBarItem.image = image
        vc.tabBarItem.selectedImage = selectedImage
        //保存tabBarItem模型到数组
        self.items.addObject(vc.tabBarItem)

        
        //添加badge
//        vc.tabBarItem.badgeValue = "10"
        let nav = GHNavigationController(rootViewController: vc)
        
        self.addChildViewController(nav)
    }



}
