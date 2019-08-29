//
//  anawerQuizuViewController.swift
//  nazonazpProject
//
//  Created by 比嘉幹樹 on 2019/08/10.
//  Copyright © 2019 比嘉幹樹. All rights reserved.
//

import UIKit

class anawerQuizuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func backToAreaButton(_ sender: UIButton) {
        performSegue(withIdentifier: "tobackarea", sender: nil)
        
    }
    
 

}
