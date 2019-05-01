//
//  ViewController.swift
//  Choice question
//
//  Created by apple on 2019/4/26.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
//import GameKit

class ViewController: UIViewController {

    //先建立一個"struct"來放選擇題的題庫
    struct QnA {
        var image: String
        var question: String
        var choice: [String]
        var answer: Int
    }
    //var player: AVPlayer?      //5/1
    //var questions: [String] = [] //5/1目前題目選項陣列
    
    
    //再建一個array陣列存放題庫數量
    var number = [0,1,2,3,4,5,6,7,8,9]
    //題數
    var questionCount = 0
    //得分數
    var score = 0
    //正解
    var rightAnswer = 0

    
    var questionData = [QnA(image: "girlA", question: "給聖誕老人拉雪橇的是麋鹿還是馴鹿？",
        choice: ["馴鹿", "麋鹿", "雪橇犬"], answer: 1),
        QnA(image: "girlB", question: "斑馬的皮膚是什麼顏色？",
        choice: ["黑色", "白色", "粉膚色"], answer: 1),
        QnA(image: "girlC", question: "蝦子的心臟位於哪裡？",
        choice: ["軀幹", "尾巴", "蝦頭"], answer: 3),
        QnA(image: "girlA", question: "愛因斯坦在幾歲時都不能流利說話，他媽媽曾經一度以為他是弱智。",choice: ["3歲", "5歲", "9歲"], answer: 3),
        QnA(image: "girlB", question: "111,111,111 x 111,111,111 =？",
        choice: ["13,579,246,800,297,531", "12,345,678,987,654,321", "19,999,999,999,999,991"], answer: 2),
        QnA(image: "girlC", question: "肯德基爺爺的衣服是什麼顏色？",
        choice: ["紅色西裝", "黑色西裝", "白色西裝"], answer: 3),
        QnA(image: "girlA", question: "身體哪一個器官不會生癌？",
        choice: ["心臟", "舌頭", "嘴巴"], answer: 1),
        QnA(image: "girlB", question: "以下那裡藏最多細菌？",
        choice: ["廁所", "鍵盤", "牆壁"], answer: 2),
        QnA(image: "girlC", question: "最早被打上條形碼的產品是？",
        choice: ["箭牌口香糖", "可口可樂汽水罐", "奶粉罐"], answer: 1),
        QnA(image: "girlA", question: "睡眠時的大腦比看電視時更..？",
        choice: ["一樣", "更安靜", "更活躍"], answer: 3)]
    
    @IBOutlet weak var girlImage: UIImageView!   //圖片
    @IBOutlet weak var questionNumber: UILabel!  //第幾題
    @IBOutlet weak var questionText: UILabel!   //題目
    @IBOutlet var questionChoice: [UIButton]!   //3 choices
    
    // @IBOutlet weak var replayButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scoreLabel.text = "目前 \(String(score)) 分"
        showQuestion()
    }
    
    
    
    @IBAction func choicePressed(_ sender: UIButton) {
        
        
        if sender.tag == rightAnswer {
            score = score + 10
            scoreLabel.text = "目前 \(String(score)) 分"
       // rightAnswer = UIColor(red:20/255, green:185/255, blue:175/255, alpha:1)
        }
        
        if questionCount == 10 {
            alert()
           // replayButton.isHidden = false  //隱藏 replayButton

            }
      
            
        else {
            showQuestion()
        }
      
    }
    
    @IBAction func restartPressed(_ sender: Any) {
    
        initialize()
        showQuestion()
       // replayButton.isHidden = true    //再玩一次按鈕，先將用到的變數恢復成初始值，再開始顯示題目，再玩一次按鈕要再度隱藏
    }
    
   /* func changeQuestion(){
        questionNumber = questionNumber + 1
        //progressView.progress += 0.067
//let question = multiples[number]
  //      questionCountLabel.text = "\(questionCount)"
        
    //    mul = multiples[test[count]]
         questionText.text = mul!.question
        choices = mul!.choices.shuffled()
        answersButton[0].setBackgroundImage(UIImage(named: choices[rightAnswer]), for: .normal)
        answersButton[1].setBackgroundImage(UIImage(named: choices[rightAnswer]), for: .normal)
   //唸題目
    let speech = AVSpeechUtterance(string: questionText.text!)
    let synthesizer = AVSpeechSynthesizer()
    synthesizer.speak(speech)
}*/
    
    
    
    
    func showQuestion() {
       
        questionCount = questionCount + 1
        
        let randomNumber = Int(arc4random_uniform(UInt32(number.count)))
        let value = number[randomNumber]
        
        girlImage.image = UIImage(named: questionData[value].image)
        
        questionNumber.text = "第 \(questionCount) 題"
        questionText.text = questionData[value].question
        rightAnswer = questionData[value].answer
        
        var choiceIndex = 0
        for i in 0..<questionChoice.count {
         questionChoice[i].setTitle(questionData[value].choice[choiceIndex], for: .normal)
            choiceIndex = choiceIndex + 1
        }
        
        number.remove(at: randomNumber)
        
    }
    
    func initialize() {
        
        number = [0,1,2,3,4,5,6,7,8,9]
        questionCount = 0
        score = 0
        scoreLabel.text = "目前 \(String(score)) 分"
        
    }
    //計分看結果
    func alert() {
        
        let alertController = UIAlertController(
            title: "測驗結束", message: "得分為\(score)分(滿分100)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(
            title: "確認", style: .default,
            handler:{
                (action: UIAlertAction!) -> Void in
        })
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
   
    
}

