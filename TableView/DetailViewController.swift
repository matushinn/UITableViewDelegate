//
//  DetailViewController.swift
//  TableView
//
//  Created by 大江祥太郎 on 2018/12/13.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var sampleNameLabel: UILabel!
    var selectedName:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        sampleNameLabel.text = selectedName

        
    }
    

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    

}
