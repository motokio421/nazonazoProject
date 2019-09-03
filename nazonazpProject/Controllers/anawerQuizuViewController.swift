//
//  anawerQuizuViewController.swift
//  nazonazpProject
//
//  Created by 比嘉幹樹 on 2019/08/10.
//  Copyright © 2019 比嘉幹樹. All rights reserved.
//

import UIKit
import Firebase
import STPopup


class anawerQuizuViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView! //問題数
    @IBOutlet weak var textView: UITextView!    //問題文
    @IBOutlet weak var answerbutton1: UIButton! //答え１
    @IBOutlet weak var answerbutton2: UIButton! //答え２
    @IBOutlet weak var answerbutton3: UIButton! //答え３
    @IBOutlet weak var answerbutton4: UIButton! //答え４
    
    var area = ""
    //問題を保存する変数
    var questions: [AddQuiz] = []
    
    var quizNumber = 0
    
    var quiz:AddQuiz! = nil {
        willSet {
            textView.text = newValue.question
            random(quiz: newValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画像の追加
        // 画像を変数に保存
        let answerimage = UIImage(named: "quiz1")
        //画像の表示
        imageView1.image = answerimage
        
        //firebsseに接続
        let db = Firestore.firestore()
        db.collection("questions").whereField("area", isEqualTo: area).getDocuments { (querySnapshot, error) in
            
            
            guard let documents = querySnapshot?.documents
                else {
                    // messagesの中に何もない場合。、処理を中断
                    return
            }
            
            var questions: [AddQuiz] = []
            
            for document in documents {
                
                let question = document.get("question") as! String
                let answer = document.get("answer") as! String
                let dummy1 = document.get("dummy1") as! String
                let dummy2 = document.get("dummy2") as! String
                let dummy3 = document.get("dummy3") as! String
                
               
                let quiz = AddQuiz(question: question, answer: answer, dummy1: dummy1, dummy2: dummy2, dummy3: dummy3)
                
                questions.append(quiz)
                
            }
            
            self.quiz = questions[self.quizNumber]
        }
        
    }
    
    //地域選択画面に戻る
    @IBAction func backToAreaButton(_ sender: UIButton) {
        performSegue(withIdentifier: "tobackarea", sender: nil)
        
    }
    
    //問題ランダム
    //答えの配列作成
    func random(quiz: AddQuiz) {
        var answers = [quiz.answer, quiz.dummy1, quiz.dummy2, quiz.dummy3]
        answers.shuffle()
        
        answerbutton1.setTitle(answers[0], for: .normal)
        answerbutton2.setTitle(answers[1], for: .normal)
        answerbutton3.setTitle(answers[2], for: .normal)
        answerbutton4.setTitle(answers[3], for: .normal)
    }
    
 

}
