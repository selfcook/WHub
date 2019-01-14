//
//  ViewController.swift
//  WHub
//
//  Created by 石浩 on 2018/12/17.
//  Copyright © 2018 shihao. All rights reserved.
//

import UIKit
import SnapKit
import AAInfographics


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    private var collectionView : UICollectionView?
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
        
        collectionView = UICollectionView.init()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        self.view .addSubview(collectionView!)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = "cellid"
        let cell : MainPageCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MainPageCollectionCell
        
        cell.imageView.image = UIImage.init(named: "test")
        cell.textLabel.text = String.init(format: "%@", indexPath.section)
        
        return cell
    }
}

