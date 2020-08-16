//
//  Quiz.swift
//  TestApps_for_iOS
//
//  Created by 近藤晴輝 on 2020/08/16.
//  Copyright © 2020 近藤晴輝. All rights reserved.
//

import UIKit

/**
 * クイズを管理するクラス
 */
class Quiz{
    //クイズの問題文
    let text: String
    //クイズの正解
    let correctAnswer: Bool
    //クイズのカードに表示する画像の名前
    let imageName: String
    
    /**
     * 初期化処理用メソッド
     */
    init(text : String, correctAnswer : Bool, imageName : String) {
        self.text = text
        self.correctAnswer = correctAnswer
        self.imageName = imageName
    }
}
