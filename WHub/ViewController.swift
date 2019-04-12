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
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    
    private var fileNameArr : Array<FileModel>?
    
    let fh = FileHandle.default
    
    
    
    
    
    
    
    //MARK:VC circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "本地"
        configView()
        
        fileNameArr = fh.getFileArr()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:create views
    func configView() {
        let nib = UINib(nibName: "MainPageCollectionCell", bundle: nil)
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: 375, height: 600), collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(nib, forCellWithReuseIdentifier: "reuseNum")
        header.setRefreshingTarget(self, refreshingAction: #selector(ViewController.headerRefresh))
        collectionView?.mj_header = header
        
        self.view.addSubview(collectionView!)
        layout.itemSize = CGSize(width: 70, height: 85);
        layout.headerReferenceSize = CGSize(width: 375, height: 10)
    }
    
    
    //MARK:collectionViewDelegate&datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (fileNameArr?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseNum", for: indexPath) as! MainPageCollectionCell
        
        let model = fileNameArr?[indexPath.row]
        
        let fileTypeImgName = (model?.fileType == .dir) ? "folder" : "unknown"
        cell.imageView!.image = UIImage(named: fileTypeImgName)
        cell.textLabel!.text = model?.fileName
        cell.sizeLabel!.text = (model?.fileType == .dir) ? "" : model?.fileSize
        
        return cell
    }
    
    
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//        var reuseView : UICollectionReusableView?
//        if kind == UICollectionElementKindSectionHeader {
//            var headView = UICollectionReusableView(frame: CGRect(x: 0, y: 0, width: 375, height: 30))
//
//            headView = collectionView.dequeueReusableSupplementaryView(ofKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath)
//
//            reuseView = headView
//        }
//
//        return reuseView!
//    }
    @objc func headerRefresh() {
        
        fileNameArr = fh.getFileArr()
        collectionView?.reloadData()
        
        header.endRefreshing()
    }
    
    
    
}
