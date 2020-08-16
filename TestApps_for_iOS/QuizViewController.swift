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
    //クイズを管理するクラス型のインスタンスを生成
    let manager : QuizManager = QuizManager()
    
    /**
     * デフォルトメソッド
     */
    override func viewDidLoad() {
        //親クラスのメソッドを実装
        super.viewDidLoad()
        //クイズカードの初期状態の値を格納
        self.quizCard.style = .initial
        //クイズの問題文と画像を読み込むメソッドを呼び出す
        self.loadQuiz()
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
                //クイズの回答に応じて、アニメーションで移動させるメソッドを呼び出す。
                self.answer()
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
    
    /**
     * クイズ用の問題文と画像データを読み込むメソッド
     */
    func loadQuiz(){
        //クイズの問題文を表示する
        self.quizCard.quizLabel.text = manager.currentQuiz.text
        //クイズの画像を表示する
        self.quizCard.quizImageView.image = UIImage(named: manager.currentQuiz.imageName)
    }
    
    /**
     * クイズカードをドラッグしてクイズに回答する処理
     */
    func answer(){
        //移動するCGAffineTransformオブジェクト
        var translationTransform: CGAffineTransform
        //x軸方向の移動距離
        let screenWidth = UIScreen.main.bounds.width
        //y軸方向の移動距離
        let y = UIScreen.main.bounds.height * 0.2
        //回答によってtranslationTransformの内容を変化させる。
        if self.quizCard.style == .right{
            //マル回答の時は右へ移動
            translationTransform = CGAffineTransform(translationX: screenWidth, y: y)
            self.manager.answerQuiz(answer: true)
        }else{
            //バツ回答の時は左へ移動
            translationTransform = CGAffineTransform(translationX: -screenWidth, y: y)
            self.manager.answerQuiz(answer: false)
        }
        //0.1秒遅延させて0.5秒でカードをアニメーション移動させる。
        UIView.animate(withDuration:  0.5, delay: 0.1, options: [.curveLinear],
                       animations: {
                            //クイズのカードのtransformプロパティにtranslationTransformを設定
                            self.quizCard.transform = translationTransform
                        },completion: { [unowned self] (finished) in
                            if finished{
                                //次のクイズカードを表示させるメソッドを呼び出し
                                self.showNextQuiz()
                            }
        })
    }
    
    /**
     * 次のクイズカードを表示させるメソッド
     */
    func showNextQuiz(){
        //次のクイズを取得
        self.manager.nextQuiz()
        //カードを元の位置に戻す。
        self.quizCard.transform = CGAffineTransform.identity
        //カードの状態を初期状態に戻す。
        self.quizCard.style = .initial
        //クイズを表示する。
        self.loadQuiz()
    }
}
