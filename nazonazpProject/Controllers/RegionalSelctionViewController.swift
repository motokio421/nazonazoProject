//
//  RegionalSelctionViewController.swift
//  nazonazpProject
//
//  Created by 比嘉幹樹 on 2019/08/20.
//  Copyright © 2019 比嘉幹樹. All rights reserved.
//

import UIKit

class RegionalSelctionViewController: UIViewController {
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var nisibeButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //画像の追加
        // 画像を変数に保存
        let miyakoimage = UIImage(named: "miyakomap")
        //画像の表示
        imageview.image = miyakoimage
     
    }
    

    
}
