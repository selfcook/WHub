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


class ViewController: UIViewController {
    
    var weiShowLabel : UILabel?
    private var aaChartView : AAChartView?
    private var aaChartModel : AAChartModel?
    
    
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
        
        let chartViewWidth  = self.view.frame.size.width
        let chartViewHeight = self.view.frame.size.height/2
        aaChartView = AAChartView()
        aaChartView?.frame = CGRect(x:0,
                                    y:300,
                                    width:chartViewWidth,
                                    height:chartViewHeight)
        // set the content height of aachartView
         aaChartView?.contentHeight = self.view.frame.size.height/2 - 20
        view.addSubview(aaChartView!)
        aaChartView?.scrollEnabled = false//禁止图表内容滚动
        aaChartView?.isClearBackgroundColor = true
        
        aaChartModel = AAChartModel()
            .chartType(.Line)//Can be any of the chart types listed under `AAChartType`.
            .animationType(.Bounce)
            .title("TITLE")//The chart title
            .subtitle("subtitle")//The chart subtitle
            .dataLabelEnabled(false) //Enable or disable the data labels. Defaults to false
            .tooltipValueSuffix("USD")//the value suffix of the chart tooltip
            .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                         "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                    .toDic()!,
                AASeriesElement()
                    .name("New York")
                    .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
                    .toDic()!,
                AASeriesElement()
                    .name("Berlin")
                    .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0])
                    .toDic()!,
                AASeriesElement()
                    .name("London")
                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
                    .toDic()!,])
        
        
        aaChartView?.aa_drawChartWithChartModel(aaChartModel!)
        
    }
    
    
}

