//
//  ResultViewController.swift
//  nazonazpProject
//
//  Created by 比嘉幹樹 on 2019/09/05.
//  Copyright © 2019 比嘉幹樹. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var messagelabel: UILabel!
    
    var correctcount = 0
    
    var interstitial: GADInterstitial!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = String(correctcount)

        interstitial = createAndLoadInterstitial()
    }
    
  
    
    
    @IBAction func twitterButton(_ sender: UIButton) {
        let data = [correctcount,"宮古島方言クイズ、10問中\(resultLabel.text!)問正解です"] as Any?
        let controller = UIActivityViewController(activityItems: data as! [Any], applicationActivities: nil)
        
        present(controller, animated: true, completion: nil)
    }
    

    @IBAction func backToHome(_ sender: UIButton) {
        if self.interstitial.isReady && 1 == Int.random(in: 1...3){
            self.interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
            performSegue(withIdentifier: "tohome", sender: nil)
        }
        
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-7722491977684670/1677829430")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    

}

extension ResultViewController: GADInterstitialDelegate {
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
        performSegue(withIdentifier: "tohome", sender: nil)
    }
}
