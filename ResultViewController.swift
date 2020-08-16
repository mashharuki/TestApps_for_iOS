//
//  ResultViewController.swift
//  TestApps_for_iOS
//
//  Created by 近藤晴輝 on 2020/08/16.
//  Copyright © 2020 近藤晴輝. All rights reserved.
//

import UIKit

/**
 * クイズ結果画面用ビューコントローラー
 */
class ResultViewController: UIViewController {
    
    //ラベルと接続
    @IBOutlet weak var label: UILabel!
    //テキストと接続
    @IBOutlet weak var textView: UITextView!
    //テキスト用グローバル変数
    var nameText : String = ""
    //スコア用グローバル変数
    var score: Int = 0
    
    /**
     * ボタンをタップした時に処理するメソッド
     */
    @IBAction func pushResultButton() {
    }
    
    /**
     * デフォルトで呼び出されるメソッド
     */
    override func viewDidLoad() {
        //親クラスのメソッドを実装
        super.viewDidLoad()

        
    }
    


}
