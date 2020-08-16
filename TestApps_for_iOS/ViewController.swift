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
        //クイズを管理するクラス型のインスタンスを生成
        let quizManager = QuizManager()
        //最初のクイズの問題文を取得
        print(quizManager.currentQuiz.text)
        //クイズにマル回答する
        quizManager.answerQuiz(answer: true)
        //スコアを確認する
        print(quizManager.score)
        //次のクイズを取得する
        quizManager.nextQuiz()
        //次のクイズの問題文を取得
        print(quizManager.currentQuiz.text)
    }
    
    /**
     * 最初の画面から値を受け取り、それを表示するメソッド
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //画面遷移先がクイズ回答画面であることを確認
        if let quizViewController = segue.destination as? QuizViewController{
            if let text = self.nameTextField.text{
                //クイズ回答画面の「nameText」プロパティに値を渡す。
                quizViewController.nameText = text
            }
        }
    }

    /**
     * メモリ不足時に呼び出されるメソッド
     */
    override func didReceiveMemoryWarning(){
        //親クラスのメソッドを実装
        super.didReceiveMemoryWarning()
    }
}

