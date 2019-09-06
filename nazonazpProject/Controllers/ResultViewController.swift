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
    
  
    
    
    @IBAction func twitterButton(_ sender: UIButton) {
        let data = [correctcount,"宮古島方言クイズ、10問中..."] as Any?
        let controller = UIActivityViewController(activityItems: data as! [Any], applicationActivities: nil)
        
        present(controller, animated: true, completion: nil)
    }
    

    @IBAction func backToHome(_ sender: UIButton) {
        performSegue(withIdentifier: "tohome", sender: nil)
    }
    
    

}
