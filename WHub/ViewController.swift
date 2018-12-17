//
//  ViewController.swift
//  WHub
//
//  Created by 石浩 on 2018/12/17.
//  Copyright © 2018 shihao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var weiInputView : UITextField?     //输入框
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weiInputView = UITextField(frame: CGRect(x: 50, y: 200, width: 100, height: 30));
        weiInputView?.backgroundColor = UIColor.red
        self.view.addSubview(weiInputView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

