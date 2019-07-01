//
//  HomeVC.swift
//  WHub
//
//  Created by wtoe on 2019/7/1.
//  Copyright © 2019 shihao. All rights reserved.
//  列表形式不同功能入口

import Foundation

class HomeVC: BaseVC, UITableViewDelegate, UITableViewDataSource {
    
    
    
    private var tableView : UITableView?
    
    override func viewDidLoad() {
        
        view.backgroundColor = UIColor.white
        createView()
        
    }
    
    
    func createView() {
        //导航栏title
        //首先分别创建渐变层和文本标签，然后将渐变层的mask设置为文本标签即可。
        let containerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 40))
        self.view.addSubview(containerView)
        
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 40))
        label.text = "Home"
        label.textAlignment = NSTextAlignment(rawValue: 1)!
        label.font = UIFont.boldSystemFont(ofSize: 20)
        containerView.addSubview(label)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        //        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 0.5)
        gradientLayer.frame = label.frame
        containerView.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.mask = label.layer
        
        navigationItem.titleView = containerView
        
        //TableView
        tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight), style: .plain)
        tableView?.backgroundColor = .white
        view.addSubview(tableView!)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView.init()
    }
    
    //MARK:TableviewDelegate&datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cellid"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.text = "提醒闹钟"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
