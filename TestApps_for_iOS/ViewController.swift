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

    //ラベルと接続
    @IBOutlet weak var label: UILabel!
    //テキストフィールドと接続
    @IBOutlet weak var nameTextField: UITextField!
    /**
     * ボタンをタップした際に処理するメソッド
     */
    @IBAction func pressButton(_ sender: Any) {
        self.label.text = "ボタンを押しました。"
    }
    
    /**
     * デフォルトで呼び出されるメソッド
     */
    override func viewDidLoad() {
        //親クラスのメソッドを実装
        super.viewDidLoad()
    }

    /**
     * メモリ不足時に呼び出されるメソッド
     */
    override func didReceiveMemoryWarning(){
        //親クラスのメソッドを実装
        super.didReceiveMemoryWarning()
    }
}

