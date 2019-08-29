//
//  hiraraAnswerViewController.swift
//  nazonazpProject
//
//  Created by 比嘉幹樹 on 2019/08/29.
//  Copyright © 2019 比嘉幹樹. All rights reserved.
//

import UIKit

class hiraraAnswerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bacdToArea(_ sender: UIButton) {
        performSegue(withIdentifier: "tobackarea1", sender: nil)
    }
    
   

}
