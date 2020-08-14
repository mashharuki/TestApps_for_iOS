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
        //カメラの要素を取得
        let camera = UIImagePickerController.SourceType.camera
        //
        if UIImagePickerController.isSourceTypeAvailable(camera){
            let picker = UIImagePickerController()
            picker.sourceType = camera
            picker.delegate = self
            self.present(picker,animated: true)
        }
    }
    
    /**
     * ユーザーが写真を撮影し終えた時に処理するメソッド
     */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        self.imageView.image = image
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
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

