//
//  QuizManager.swift
//  TestApps_for_iOS
//
//  Created by 近藤晴輝 on 2020/08/16.
//  Copyright © 2020 近藤晴輝. All rights reserved.
//

import UIKit

/**
 * クイズ5問を管理するクラス
 */
class QuizManager{
    //クイズ5問を格納するための配列
    var quizzes: [Quiz]
    //現在回答しているクイズの設問番号を格納する変数
    var currentIndex : Int
    //スコアを格納するための変数
    var score: Int
    
    /**
     * 回答状況を格納する列挙型変数
     */
    enum Status {
        //回答中
        case inAnswer
        //回答終了
        case done
    }
    //回答状況を格納する変数
    var status : Status
    
    /**
     * 初期化処理用メソッド
     */
    init() {
        //配列を初期化
        quizzes = []
        //問題文、正解、画像名、でクイズを作成
        //問１
        quizzes.append(Quiz(text:"人間を超でっかいネコだと思っている？",correctAnswer: true,imageName: "cat"))
        //問２
        quizzes.append(Quiz(text:"犬は食べ物の美味しさを味よりも匂いで判断している？",correctAnswer: true,imageName: "dog"))
        //問３
        quizzes.append(Quiz(text:"トラのしましま模様は皮膚まで繋がっていない？",correctAnswer: true,imageName: "tiger"))
        //問４
        quizzes.append(Quiz(text:"クマは走る時に全部の足がバラバラに動いている？",correctAnswer: true,imageName: "bear"))
        //問５
        quizzes.append(Quiz(text:"パンダの一番の好物は、笹である？",correctAnswer: true,imageName: "panda"))
        //各変数を初期化
        currentIndex = 0
        score = 0
        status = .inAnswer
    }
    
    /**
     * 現在のクイズを取得する計算型プロパティ
     */
    var currentQuiz : Quiz{
        get{
            return self.quizzes[currentIndex]
        }
    }
    
    /**
     * クイズのスコアを記録するメソッド
     */
    func answerQuiz(answer : Bool){
        if (self.currentQuiz.correctAnswer == answer) {
            score += 1
        }
    }
    
    /**
     * 次のクイズを取得するメソッド
     */
    func nextQuiz(){
        //最後のクイズだったら、回答を終了する。
        if currentIndex < quizzes.count - 1 {
            currentIndex += 1
        }else{
            status = .done
        }
    }
}
