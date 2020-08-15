//
//  ListViewController.swift
//  TestApps_for_iOS
//
//  Created by 近藤晴輝 on 2020/08/15.
//  Copyright © 2020 近藤晴輝. All rights reserved.
//

import UIKit

/**
 * デフォルト画面で使用するビューコントローラークラス
 */
class ListViewController: UITableViewController{
    
    /**
     * 表示するセルの数を３つにするメソッド
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    /**
     * 表示するセルを作成するメソッド
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //表示するセルを作成
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: <#T##IndexPath#>)
        //作成したセルを返す
        return cell
    }
}
