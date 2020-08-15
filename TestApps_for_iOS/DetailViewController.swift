//
//  DetailViewController.swift
//  TestApps_for_iOS
//
//  Created by 近藤晴輝 on 2020/08/15.
//  Copyright © 2020 近藤晴輝. All rights reserved.
//

import UIKit
import WebKit

/**
 * 記事本文の内容を表示するビューコントローラークラス
 */
class DetailViewController : UIViewController{
    
    //DetailViewControllerと接続
    @IBOutlet weak var webview: WKWebView!
    
    //link用プロパティを用意
    var link : String!
    
    override func viewDidLoad() {
        //親クラスのメソッドを実装
        super.viewDidLoad()
        if let url = URL(string: self.link){
            let request = URLRequest(url: url)
            self.webview.load(request)
        }
    }
}
