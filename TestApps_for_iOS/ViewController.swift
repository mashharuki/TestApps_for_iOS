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

    /** imageViewと接続 */
    @IBOutlet weak var imageView: UIImageView!
    
    /**
     * ツールバーのカメラアイコンと接続
     */
    @IBAction func launchCamera(_ sender: UIBarButtonItem) {
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

