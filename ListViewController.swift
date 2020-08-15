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
class ListViewController: UITableViewController,XMLParserDelegate{
    
    //必要な変数を宣言
    var parser : XMLParser!
    var items = [Item]()
    var item : Item?
    var currentString = ""
        
    /**
     * 表示するセルの数を３つにするメソッド
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //表示するセル数を返す。
        return items.count
    }
    
    /**
     * 表示するセルを作成するメソッド
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //表示するセルを作成（セルを再利用するように設定している。）
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //タイトルプロパティを取得
        cell.textLabel?.text = items[indexPath.row].title
        //作成したセルを返す
        return cell
    }
    
    /**
     *
     */
    override func viewDidAppear(_ animated: Bool) {
        //親クラスのメソッドを実装
        super.viewDidAppear(animated)
        //記事をダウンロードする関数を呼び出す。
        startDownload()
    }
    
    
    /**
     *
     */
    func startDownload(){
        self.items = []
        if let url = URL(string : "https://www.apple.com/jp/newsroom/rss-feed.rss"){
            if let parser = XMLParser(contentsOf: url){
                self.parser = parser
                self.parser.delegate = self
                self.parser.parse()
            }
        }
    }
    
    /**
     *
     */
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        self.currentString = ""
        if elementName == "item"{
            self.item = Item()
        }
    }
    
    /**
     *
     */
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        self.currentString += string
    }
    
    /**
     *
     */
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        //要素名ごとに格納する変数の内容を変化させる。
        switch elementName{
            case "title" : self.item?.title = currentString
            case "link" : self.item?.link = currentString
            case "item" : self.items.append(self.item!)
            default : break
        }
    }
    
    /**
     *
     */
    func parserDidEndDocument(_ parser: XMLParser) {
        self.tableView.reloadData()
    }
}
