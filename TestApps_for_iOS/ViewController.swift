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
class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    /** 画面上のimageView要素を取得*/
    @IBOutlet weak var imageView: UIImageView!
    
    /**
     * ツールバーのカメラアイコンを押した時に処理するメソッド
     */
    @IBAction func launchCamera(_ sender: UIBarButtonItem) {
        //画像の取得方法を変数に格納する。　ここでは、カメラロールの画像が表示されるように設定。
        let camera = UIImagePickerController.SourceType.camera
        //カメラのないデバイスでは実行されないようにチェックしている。
        if UIImagePickerController.isSourceTypeAvailable(camera){
            //カメラの画像を表示するためにモーダルビューコントローラーを作成する。
            let picker = UIImagePickerController()
            //cameraをモーダルコントローラーに設定する。
            picker.sourceType = camera
            picker.delegate = self
            //モーダルビューコントローラーを前面に出して、カメラ画面を表示する。
            self.present(picker,animated: true)
        }
    }
    
    /**
     * ユーザーが写真を撮影し終えた時に処理するメソッド
     */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //infoからオリジナルの画像を取り出す。
        let image = info[.originalImage] as! UIImage
        //イメージビューに画像を表示する。
        self.imageView.image = image
        //取得した画像をアルバムに保存する。
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        //モーダルビューコントローラーを消去して、元の画像を表示する。
        self.dismiss(animated: true)
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

