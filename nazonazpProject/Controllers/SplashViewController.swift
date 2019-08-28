//
//  SplashViewController.swift
//  nazonazpProject
//
//  Created by 比嘉幹樹 on 2019/08/20.
//  Copyright © 2019 比嘉幹樹. All rights reserved.
//

import UIKit
import RevealingSplashView

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "waido_logo")!,iconInitialSize: CGSize(width: 90, height: 90), backgroundColor: UIColor(red:0.11, green:0.56, blue:0.95, alpha:1.0))
        
        self.view.addSubview(revealingSplashView)
        
        // splash終わった後の処理
        revealingSplashView.startAnimation(){
            print("Completed")
            self.performSegue(withIdentifier: "toViewcontroller", sender: nil)
            
        }
        
       
        
    
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
