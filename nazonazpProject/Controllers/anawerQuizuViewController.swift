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
    
    var answers:[String] = []
    
    var quizNumber = 0
    
    var quiz:AddQuiz! = nil {
        willSet {
            textView.text = newValue.question
            random(quiz: newValue)
        }
    }
    
    var correctcount = 0
    
    //画像の配列
    let images = [
        "quiz1",
        "quiz2",
        "quiz3",
        "quiz4",
        "quiz5",
        "quiz6",
        "quiz7",
        "quiz8",
        "quiz9",
        "quiz10",
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 画像を変数に保存
        //let answerimage = UIImage(named: "quiz1")
        
        //画像の表示
        imageView1.image = UIImage(named: images[quizNumber])
        
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
            
            questions.shuffle()
            self.questions = questions
            
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
        answers = [quiz.answer, quiz.dummy1, quiz.dummy2, quiz.dummy3]
        answers.shuffle()
        
        answerbutton1.setTitle(answers[0], for: .normal)
        answerbutton2.setTitle(answers[1], for: .normal)
        answerbutton3.setTitle(answers[2], for: .normal)
        answerbutton4.setTitle(answers[3], for: .normal)
    }
    
    //アラートの作成
    @IBAction func didClickButoon1(_ sender: UIButton) {
        
        
        if quiz.answer == answers[0] {
            
             correctCase()
            
        } else {
            
            wrongCase()
        
    }
    }
    
    fileprivate func correctCase() {
        correctcount += 1
        
        //正解アラート作成
        let alert = UIAlertController(title: "⭕️", message: "正解です", preferredStyle:.alert)
        
        let backAction = UIAlertAction(title: "次の問題へ", style: .default) { (UIAlertAction) in
            print("次の問題")
            self.goNextQuiz()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            
            
            alert.addAction(backAction)
            
            
            self.present(alert, animated: true, completion:nil)
            
        }
    }
    
    fileprivate func wrongCase() {
        //不正解アラート作成
        let alert = UIAlertController(title: "❌", message: "答えは\(quiz.answer)です", preferredStyle:.alert)
        
        let backAction = UIAlertAction(title: "次の問題へ", style: .default) { (UIAlertAction) in
            print("次の問題")
            self.goNextQuiz()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            
            
            alert.addAction(backAction)
            
            
            self.present(alert, animated: true, completion:nil)
            
            
        }
    }
    
    @IBAction func didCkickButton2(_ sender: UIButton) {
        if quiz.answer == answers[1] {
            
            correctCase()
            
        } else {
            
            
            wrongCase()
            
        }
        
    }
    

    @IBAction func didClickButton3(_ sender: UIButton) {
        if quiz.answer == answers[2] {
            
             correctCase()
           
        } else {
            
           wrongCase()
           
        }
    }
    
    @IBAction func didCkickButton4(_ sender: UIButton) {
        if quiz.answer == answers[3] {
            
            correctCase()
            
        } else {
            
            
            wrongCase()
            
        }
    }
    
    func goNextQuiz() {
        quizNumber += 1
        
        //Result 画面遷移
        if quizNumber == 10 {
            
            performSegue(withIdentifier: "toResult", sender: correctcount)
            
           
        } else {
            imageView1.image = UIImage(named: images[quizNumber])
            quiz = questions[quizNumber]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if segue.identifier == "toResult" {
                
                let nextVC = segue.destination as! ResultViewController
                
                nextVC.correctcount = sender as! Int
            }
    }
    
//    //Result画面に画面遷移
//    func resulttransition()  {
//
//        if quizNumber == 10 {
//            performSegue(withIdentifier: "toResult", sender: nil)
//        }
//
//    }
    
}
