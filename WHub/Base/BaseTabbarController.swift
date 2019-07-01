//
//  BaseTabbarViewController.swift
//  WHub
//
//  Created by wtoe on 2019/5/9.
//  Copyright © 2019年 shihao. All rights reserved.
//

import Foundation


class BaseTabbarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubController();
        
    }
    
    func addSubController() {
        let homeVC = HomeVC()
        let homeNav = UINavigationController(rootViewController:homeVC)
//        fileNav.tabBarItem.title = "文件"
        homeNav.tabBarItem.image = UIImage(named:"tabbar_files")
        homeNav.tabBarItem.selectedImage = UIImage(named:"tarbar1_yes")
        homeNav.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0)
        
        let transferVC = TransferFileVC()
        let transferNav = UINavigationController(rootViewController:transferVC)
//        transferNav.tabBarItem.title = "传输"
        transferNav.tabBarItem.image = UIImage(named:"tabbar_transfer")
        transferNav.tabBarItem.selectedImage = UIImage(named:"tarbar1_yes")
        transferNav.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0)
        
        let settingVC = SettingVC()
        let settingNav = UINavigationController(rootViewController:settingVC)
//        settingNav.tabBarItem.title = "设置"
        settingNav.tabBarItem.image = UIImage(named:"tabbar_setting")
        settingNav.tabBarItem.selectedImage = UIImage(named:"tarbar1_yes")
        settingNav.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0)
        
        // 添加工具栏
        let items = [homeNav,transferNav,settingNav]
        self.viewControllers = items
        
        //tabBar 底部工具栏背景颜色 (以下两个都行)
//        self.tabBar.barTintColor = UIColor.clear
//        self.tabBar.backgroundColor = UIColor.white
    }
}
