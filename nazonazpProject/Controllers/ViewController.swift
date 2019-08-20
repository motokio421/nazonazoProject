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
    
    //画面遷移　view->addquizu
    @IBAction func QuizuMadeButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toAddQuizu", sender: nil)
    }
    //画面遷移　view->regional
    @IBAction func AnswerButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toRegional", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    

}

