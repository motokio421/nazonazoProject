//
//  addQuizuViewController.swift
//  nazonazpProject
//
//  Created by 比嘉幹樹 on 2019/08/10.
//  Copyright © 2019 比嘉幹樹. All rights reserved.
//

import UIKit
import Firebase
import McPicker

class addQuizuViewController: UIViewController {
    
    //登録された問題を保存する変数
    var questions: AddQuiz! = nil
    
    @IBOutlet weak var questonTextfiled: UITextField!
    @IBOutlet weak var answerTextfiled: UITextField!
    @IBOutlet weak var dummy1Textfiled: UITextField!
    @IBOutlet weak var dummy2Textfiled: UITextField!
    @IBOutlet weak var dummy3Textfiled: UITextField!
    @IBOutlet weak var areaTextfield: McTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //配列作成
        let data: [[String]] = [["西辺", "平良", "多良間"]]
        
        let mcInputView = McPicker(data: data)
        mcInputView.backgroundColor = .gray
        mcInputView.backgroundColorAlpha = 0.25
        areaTextfield.inputViewMcPicker = mcInputView

        areaTextfield.doneHandler = { [weak areaTextfield] (selections) in
            self.areaTextfield?.text = selections[0]!
        }
        areaTextfield.selectionChangedHandler = { [weak areaTextfield] (selections, componentThatChanged) in
            self.areaTextfield?.text = selections[componentThatChanged]!
        }
        areaTextfield.cancelHandler = { [weak areaTextfield] in
            self.areaTextfield?.text = "Cancelled."
        }
        areaTextfield.textFieldWillBeginEditingHandler = { [weak areaTextfield] (selections) in
            if areaTextfield?.text == "" {
                // Selections always default to the first value per component
                areaTextfield?.text = selections[0]
            }
        }
    }
    

    @IBAction func didClickRegistrabutton(_ sender: UIButton) {
        
        //firebaseに接続
        let db = Firestore.firestore()
        db.collection("questions").addDocument(data: [
            "question": questonTextfiled.text,
            "answer": answerTextfiled.text,
            "dummy1": dummy1Textfiled.text,
            "dummy2": dummy2Textfiled.text,
            "dummy3": dummy3Textfiled.text,
            "area": areaTextfield.text
            
        ])
        
       
        
        
        
        
        //登録ありがとうアラート作成！！
        let alert = UIAlertController(title: "タイトル", message: "登録ありがとう", preferredStyle:.alert)
        
        let backAction = UIAlertAction(title: "ホームに戻る", style: .default) { (UIAlertAction) in
            print("ホームに戻る")
            self.performSegue(withIdentifier: "toviewController", sender: nil)
        }
        
        
             //アラートが消えるのと画面遷移が重ならないように0.5秒後に画面遷移するようにしてる
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
           
            
            
            alert.addAction(backAction)
            
            
            self.present(alert, animated: true, completion:nil)
                
        }
        
    }
    
   
    
    
        
    }
    

    
    
   

