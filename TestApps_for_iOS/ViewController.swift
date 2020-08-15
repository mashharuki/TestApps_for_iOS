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
    
    /** ラベルと接続 */
    @IBOutlet weak var label: UILabel!
    
    /**
     * ボタンと接続
     */
    @IBAction func sayHello() {
        label.text = NSLocalizedString("Hello", comment: "ボタンをタップした時に表示する文言です。")
    }
    
    /**
     * デフォルト処理
     */
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /**
     * メモリ不足になった時に自動的に呼び出されるメソッド
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

