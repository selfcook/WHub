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
    
    private var listArr : Array<Any>?
    private var listImgArr : Array<Any>?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        createView()
        
        //列表名称及图表
        listArr = ["提醒闹钟","稍后阅读","播放器"]
        listImgArr = ["home_alarm","home_readlater","home_player"]
    }
    
    
    func createView() {
        //导航栏title
        //首先分别创建渐变层和文本标签，然后将渐变层的mask设置为文本标签即可。
        let containerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 40))
        self.view.addSubview(containerView)
        
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 40))
        label.text = "Mixed"
        label.textAlignment = NSTextAlignment(rawValue: 1)!
        label.font = UIFont.boldSystemFont(ofSize: 20)
        containerView.addSubview(label)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.yellow.cgColor]
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
        tableView?.separatorStyle = .none
    }
    
    //MARK:TableviewDelegate&datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cellid"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        let imgName = listImgArr![indexPath.row]
        cell?.imageView?.image = UIImage(named: imgName as! String)
        
        cell?.textLabel?.text = listArr![indexPath.row] as? String
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(AlarmVC(), animated: true)
        case 1: break
        case 2:
            navigationController?.pushViewController(FileViewController(), animated: true)
        default: break
            
        }
    }
}
