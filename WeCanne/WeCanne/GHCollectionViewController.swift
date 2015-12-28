//
//  GHCollectionViewController.swift
//  WeCanne
//
//  Created by jgh on 15/12/26.
//  Copyright © 2015年 jgh. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class GHCollectionViewController: UICollectionViewController {

    weak var control:UIPageControl?
    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = UIScreen.mainScreen().bounds.size
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .Horizontal
        super.init(collectionViewLayout: layout)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //self.collectionView != self.view
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.backgroundColor = UIColor.clearColor()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(GHCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        //分页
        self.collectionView?.pagingEnabled = true
        self.collectionView?.bounces = false
        self.collectionView?.showsHorizontalScrollIndicator = false
        // 添加pageController
        self.setUpPageControl()

    }
    func setUpPageControl(){
        // 添加pageController,只需要设置位置，不需要管理尺寸
        let pageC = UIPageControl()
        pageC.numberOfPages  = 4
        pageC.pageIndicatorTintColor = UIColor.blackColor()
        pageC.currentPageIndicatorTintColor = UIColor.redColor()
        // 设置center
        pageC.center = CGPointMake(self.view.width! * 0.5, self.view.height! * 0.95)
        self.control = pageC
        self.view.addSubview(pageC)
    }
    
//MARK: - UIScrollView代理
    // 只要一滚动就会调用

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        // 获取当前的偏移量，计算当前第几页
        let page = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5
        self.control?.currentPage = Int(page)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }
    
    
    // dequeueReusableCellWithReuseIdentifier
    // 1.首先从缓存池里取cell
    // 2.看下当前是否有注册Cell,如果注册了cell，就会帮你创建cell
    // 3.没有注册，报错
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! GHCollectionViewCell

//        let screenH = UIScreen.mainScreen().bounds.size.height
        // Configure the cell
        //拼接图片名称
        let imageName = "new_feature_\(indexPath.row + 1)"
//        if (screenH > 480) {
//            imageName = "new_feature_\(indexPath.row + 1)-568h"
//        }
        cell.image = UIImage(named: imageName)
        cell.setIndexPath(indexPath, count: 4)
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
