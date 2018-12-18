//
//  ViewController.swift
//  WHub
//
//  Created by 石浩 on 2018/12/17.
//  Copyright © 2018 shihao. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var weiShowLabel : UILabel?
    
    //MARK:VC circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:create views
    func configView() {
        
        weiShowLabel = UILabel();
        weiShowLabel?.backgroundColor = UIColor.gray
        weiShowLabel?.textAlignment = NSTextAlignment.center
        weiShowLabel?.font = UIFont.systemFont(ofSize: 18)
        self.view.addSubview(weiShowLabel!)
        weiShowLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(100)
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
        })
        
        

    }
    
    
}

