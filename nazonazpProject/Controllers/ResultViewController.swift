//
//  ResultViewController.swift
//  nazonazpProject
//
//  Created by 比嘉幹樹 on 2019/09/05.
//  Copyright © 2019 比嘉幹樹. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var messagelabel: UILabel!
    
    var correctcount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = String(correctcount)

    }
    
    @IBAction func backToQuizbutton(_ sender: UIButton) {
    }
    
    
    @IBAction func twitterButton(_ sender: UIButton) {
    }
    

    @IBAction func backToHome(_ sender: UIButton) {
    }
    
    

}
