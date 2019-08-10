//
//  ViewController.swift
//  nazonazpProject
//
//  Created by 比嘉幹樹 on 2019/08/08.
//  Copyright © 2019 比嘉幹樹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func QuizuMadeButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toAddQuizu", sender: nil)
    }
    
    @IBAction func AnswerButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toAnswerQuizu", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    

}

