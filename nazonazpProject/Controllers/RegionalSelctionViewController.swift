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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //画像の追加
        // 画像を変数に保存
        let miyakoimage = UIImage(named: "miyakomap")
        //画像の表示
        imageview.image = miyakoimage
     
    }
    
//地域ごとに画面遷移
    @IBAction func nisibeDidClickButton(_ sender: UIButton) {
        performSegue(withIdentifier: "tonisibeAnswer", sender: "西辺")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "tonisibeAnswer" {
            
            let nextVC = segue.destination as! anawerQuizuViewController
            
            nextVC.area = sender as! String
            
        }
        
    }
    
    @IBAction func hiraraDidCkickButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toHirara", sender: nil)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "tonisibeAnswer" {
//            
//            let nextVC = segue.destination as! anawerQuizuViewController
//            
//            nextVC.area = sender as! String
//            
//        }
//        
//    }
    
    @IBAction func taramaDidClickButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toTarama", sender: nil)
    }
    
    
}

