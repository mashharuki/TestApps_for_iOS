//
//  ViewController.swift
//  TestApps_for_iOS
//
//  Created by 近藤晴輝 on 2020/08/09.
//  Copyright © 2020 近藤晴輝. All rights reserved.
//

import UIKit

/**
 * デフォルト画面用コントローラークラス
 */
class ViewController: UIViewController {

    
    /**ボタンと接続*/
    @IBOutlet weak var label: UILabel!
    
    /**
     * スライドバーと接続
     */
    @IBAction func showValue(_ sender: UISlider) {
        label.text = "\(sender.value)"
    }
    
    /**
     * デフォルト処理
     */
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /**
     * メモリ不足の際に呼び出す処理
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

