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

    /** 画像と接続 */
    @IBOutlet weak var imageView: UIImageView!
    
    /**
     * ツールバーと接続
     */
    @IBAction func showActivityView(_ sender: UIBarButtonItem) {
        //変数controllerを用意
       let controller = UIActivityViewController(activityItems : [ imageView.image! ] ,applicationActivities : nil)
       //モーダルビューコントローラーとして表示 self:自分自身のインスタンス
        self.present(controller,animated: true,completion: {print("表示完了！")} )
    }
    
    /**
     * デフォルトで呼び出されるメソッド
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    /**
     * メモリ不足時に呼び出されるメソッド
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

