//
//  QuizViewController.swift
//  TestApps_for_iOS
//
//  Created by 近藤晴輝 on 2020/08/16.
//  Copyright © 2020 近藤晴輝. All rights reserved.
//

import UIKit

/**
 * クイズ画面用ビューコントローラークラス
 */
class QuizViewController: UIViewController {
    
    //画面上のラベルと接続
    @IBOutlet weak var label: UILabel!
    //最初の画面で入力された名前の情報を格納するための変数
    var  nameText: String = ""
    
    /**
     * デフォルトメソッド
     */
    override func viewDidLoad() {
        //親クラスのメソッドを実装
        super.viewDidLoad()
        
    }
    
    

}
