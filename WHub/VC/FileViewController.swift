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


class FileViewController: BaseVC, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    private var collectionView : UICollectionView?
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    
    private var fileNameArr : Array<FileModel>?
    
    let fh = FileHandle.default
    
    
    
    
    
    
    
    //MARK:VC circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.white
        configView()
        
        fileNameArr = fh.getFileArr()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:create views
    func configView() {
        let nib = UINib(nibName: "MainPageCollectionCell", bundle: nil)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(5, 10, 0, 5)
        collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: 375, height: 600), collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(nib, forCellWithReuseIdentifier: "reuseNum")
        header.setRefreshingTarget(self, refreshingAction: #selector(FileViewController.headerRefresh))
        header.lastUpdatedTimeLabel.isHidden = true
        collectionView?.mj_header = header
        
        self.view.addSubview(collectionView!)
        layout.itemSize = CGSize(width: 70, height: 85);
        layout.headerReferenceSize = CGSize(width: 375, height: 10)
        
        
        //导航栏title
        //首先分别创建渐变层和文本标签，然后将渐变层的mask设置为文本标签即可。
        let containerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 40))
        self.view.addSubview(containerView)
        
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 40))
        label.text = "本地文件"
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
