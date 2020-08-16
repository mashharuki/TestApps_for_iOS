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
        //名前を出力します。
        self.label.text = "\(self.nameText)さん　あなたのスコアは\(self.score)です。"
        //文言を格納する変数
        var text =  ""
        //スコアに応じて格納する文言を変化させる。
        switch self.score {
           case 0...2:
               text = "動物に関してあまり興味はないでしょうか？\n\nもっと頑張りましょう！"
           case 3,4:
               text = "動物にはかなり詳しい方ですね！\n\nもう少しです！"
           case 5:
               text = "全問正解です！\n\nおめでとうございます！"
           default:
               break
           }
        //スコアに応じた文言を出力
       self.textView.text = text
    }
    


}
