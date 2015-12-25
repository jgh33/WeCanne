//
//  GHHomeViewController.swift
//  WeCanne
//
//  Created by jgh on 15/12/21.
//  Copyright © 2015年 jgh. All rights reserved.
//

import UIKit

class GHHomeViewController: UITableViewController, GHCoverDelegate{
    
    var titleButton:GHTitleButton!
    lazy var one:GHOneViewController = GHOneViewController()
    
    // UIBarButtonItem:决定导航条上按钮的内容
    // UINavigationItem:决定导航条上内容
    // UITabBarItem:决定tabBar上按钮的内容
    // ios7之后，会把tabBar上和导航条上的按钮渲染
    // 导航条上自定义按钮的位置是由系统决定，尺寸才需要自己设置。
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpNavgationBar()    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 设置导航条_____________________________________
    func setUpNavgationBar(){
        //zuo
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.barButtonItemWithImage(UIImage(named: "navigationbar_friendsearch")!, highImage: UIImage(named: "navigationbar_friendsearch_highlighted")!, target: self, action: "friendsearch", controlEvents: .TouchUpInside)
        //you
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.barButtonItemWithImage(UIImage(named: "navigationbar_pop")!, highImage: UIImage(named: "navigationbar_pop_highlighted")!, target: self, action: "pop", controlEvents: .TouchUpInside)
        
        // titleView
        self.titleButton = GHTitleButton(type: .Custom)
        self.titleButton.setTitle("首页", forState: .Normal)
        self.titleButton.setImage(UIImage(named: "navigationbar_arrow_up"), forState: .Normal)
        self.titleButton.setImage(UIImage(named: "navigationbar_arrow_down"), forState: .Selected)
        
        
        // 高亮的时候不需要调整图片
        self.titleButton.adjustsImageWhenHighlighted = false
        self.titleButton.addTarget(self, action: "titleClick:", forControlEvents: .TouchUpInside)
        self.navigationItem.titleView = self.titleButton
    }
    
//    / 以后只要显示在最前面的控件，一般都加在主窗口
    // 点击标题按钮
    func titleClick(button:UIButton){
        button.selected = !button.selected
        // 弹出蒙板
        let cover = GHCover()
        cover.delegate = self
        // 弹出pop菜单
        let popW:CGFloat = 200
        let popX = (self.view.width! - 200) * 0.5
        let popH = popW
        let popY:CGFloat = 55
        let menu = GHPopMenu(showInRect: CGRectMake(popX, popY, popW, popH))
        menu.contentView = self.one.view

        
    }
    
    // 点击蒙板的时候调用
    func coverDidClickCover(cover: GHCover) {
        // 隐藏pop菜单
        GHPopMenu.hide()
        self.titleButton.selected = false
    }
    
    func friendsearch(){
        
    }
    
    func pop(){
//        self.titleButton.setImage(nil , forState: .Normal)
        let one = GHOneViewController()
        //当push的时候隐藏底部条（系统自带的）
        one.hidesBottomBarWhenPushed = true
        
        //跳转到另一个控制器
        self.navigationController?.pushViewController(one, animated: true)

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
