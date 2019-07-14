//
//  BaseVC.swift
//  WHub
//
//  Created by wtoe on 2019/5/9.
//  Copyright © 2019年 shihao. All rights reserved.
//

import Foundation

class BaseVC: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
    }
}
