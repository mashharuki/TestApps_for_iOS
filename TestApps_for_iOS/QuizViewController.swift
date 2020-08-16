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
    //クイズカード用要素と接続
    @IBOutlet weak var quizCard: QuizCard!
    
    /**
     * デフォルトメソッド
     */
    override func viewDidLoad() {
        //親クラスのメソッドを実装
        super.viewDidLoad()
        //クイズカードの初期状態の値を格納
        self.quizCard.style = .initial
        //ジェスチャの動きを検知して処理する
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragQuizCard(_:)))
         //ジェスチャを検知させたいオブジェクトを指定
        self.quizCard.addGestureRecognizer(panGestureRecognizer)
    }
        /**
         * ドラッグを検知するメソッド
         */
        @objc func dragQuizCard(_ sender : UIPanGestureRecognizer){
            print("ドラッグしました。")
        }
    }
