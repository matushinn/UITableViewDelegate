//
//  ViewController.swift
//  TableView
//
//  Created by 大江祥太郎 on 2018/10/26.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
//TableView
    @IBOutlet weak var foodTableView: UITableView!
    
    var foods = ["カレー","ハンバーグ","プリン"]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //データソースメソッドをこのファイル内で処理します
        foodTableView.dataSource = self
        //tableViewの不要な線を消す
        foodTableView.tableFooterView = UIView()
        
        foodTableView.delegate = self
        
        //カスタムセルの登録
        let nib = UINib(nibName: "FoodTableViewCell", bundle: Bundle.main)
        foodTableView.register(nib, forCellReuseIdentifier: "Cell")
    }
    
    //TableViewに表示するデータの個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    //TableViewに表示するデータの内容
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //idをつけたCellの取得//
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! FoodTableViewCell
        
        cell.foodNameLabel.text = foods[indexPath.row]
        //Cellを返す
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        //選択状態解除
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let selectedIndex = foodTableView.indexPathForSelectedRow
        //値渡し
        detailViewController.selectedName = foods[(selectedIndex?.row)!]
    }


}

