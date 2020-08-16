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
        //ジェスチャの状態に応じて処理を変化させる
        switch sender.state {
            case .began, .changed:
                self.transformQuizCard(gesture : sender)
        case .ended:
                break;
            default:
                break
        }
    }
    
    /**
     * ジェスチャの動きをUIに反映させるためのメソッド
     */
    func transformQuizCard(gesture : UIPanGestureRecognizer){
        //移動した距離を取得
        let translation = gesture.translation(in: self.quizCard)
        //移動した距離を元にCGAffineTransformオブジェクトを作成(1)
        let translationTransform = CGAffineTransform(translationX: translation.x, y: translation.y)
        //画面の幅の半分に対する移動した距離の割合
        let translationPercent = translation.x/UIScreen.main.bounds.width/2
        //割合に対して角度を算出
        let rotationAngle = CGFloat.pi/3 * translationPercent
        //算出した角度でのCGAffineTransformオブジェクトを作成(2)
        let rotationTransform = CGAffineTransform(rotationAngle: rotationAngle)
        //変換のオブジェクトを合成(3)
        let transform = translationTransform.concatenating(rotationTransform)
        //quizCardに反映
        self.quizCard.transform = transform
        
        //移動させた方向が左ならマル、右ならバツ
        if translation.x > 0{
            self.quizCard.style = .right
        }else{
            self.quizCard.style = .wrong
        }
    }
}
