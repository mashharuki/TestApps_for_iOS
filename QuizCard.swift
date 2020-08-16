//
//  QuizCard.swift
//  TestApps_for_iOS
//
//  Created by 近藤晴輝 on 2020/08/16.
//  Copyright © 2020 近藤晴輝. All rights reserved.
//

import UIKit

/**
 * クイズ回答画面のクイズカード用クラス
 */
class QuizCard: UIView {

    //クイズ回答画面のrightアイコンと接続する
    @IBOutlet weak var iconImageView : UIImageView!
    //クイズ回答画面のネコの画像と接続する
    @IBOutlet weak var quizImageView : UIImageView!
    //クイズ回答画面の問題文の部分と接続する
    @IBOutlet weak var quizLabel : UILabel!
    
    //クイズの回答状況を定義する。
    enum QuizStyle{
        case initial
        case right
        case wrong
    }
    
    //プロパティの監視
    var style: QuizStyle = .initial{
        //値が設定された直後に処理する内容
        didSet{
            self.setQuizStyle(style : style)
        }
    }
        
    /**
     *クイズプロパティの値が変化した時に処理するメソッド
    */
    func setQuizStyle(style : QuizStyle) {
        //プロパティの状態により、背景色とアイコンを変化させる処理
        switch style {
            //初期値の場合
            case .initial :
                self.backgroundColor = UIColor(named: "normal background")
                self.iconImageView.isHidden = true
            //マルを選択した場合
            case .right :
                 self.backgroundColor = UIColor(named: "Base-1")
                 self.iconImageView.isHidden = false
                 self.iconImageView.image = UIImage(named : "right icon")
            //バツを選択した場合
            case .wrong :
                 self.backgroundColor = UIColor(named: "Base-2")
                 self.iconImageView.isHidden = false
                 self.iconImageView.image = UIImage(named : "wrong icon")
        }
    }
}
