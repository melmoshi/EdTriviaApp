//
//  StartScreen.swift
//  FinishTheLyricsEdSheeran
//
//  Created by Mel and Sand on 2017-06-13.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import UIKit
import GameKit


var points = 0
    //tracks number of right answers

class StartScreen: UIViewController {
    

    @IBOutlet weak var btn1: AnswerButton!
    
    @IBOutlet weak var btn2: AnswerButton!
    
    @IBOutlet weak var btn3: AnswerButton!
    
    @IBOutlet weak var btn4: AnswerButton!
    
    
    @IBOutlet weak var questionLbl: UILabel!
        //Question Label
    
    
    @IBOutlet weak var chapterLbl: UILabel!
        //Label that declares what question you're on (1/10)
    
    var currentQuestion = randomNum()
        //current question in the array 
    
    var rightAnswerPlacement = 0
        //where the right answer is in the array
    
    var questionsSeen = 0
        //counts number of questions seen
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        points = 0
        
        if levelChosen == true {
            parseCSV(csv: "EdTriviaEasy")
        } else {
            parseCSV(csv: "EdTriviaHard")
        }
        
        
        updateArray()
            //replaces "=" with commas in the array
        
        currentQuestion = randomNum()
        
        newQuestion()
            //Updates question
        
        chapterLbl.text = "\(questionsSeen)/\(questionsAllowed)"
    }
    
    
    //Function that displays new question
    func newQuestion() {
        
        questionLbl.text = newArray[currentQuestion].question
        
        questionsSeen += 1
        chapterLbl.text = "\(questionsSeen) / \(questionsAllowed)"
        
        rightAnswerPlacement = Int(arc4random_uniform(4)) + 1
        
        //create button
        var button: UIButton = UIButton()
        
        //var x = 1
        
        for i in 1...4 {
            
            //create button
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnswerPlacement)) {
                button.setTitle(newArray[currentQuestion].answer, for: .normal)
            } else if (i == 1) {
                button.setTitle(newArray[currentQuestion].wrong1, for: .normal)
            } else if (i == 2) {
                button.setTitle(newArray[currentQuestion].wrong2, for: .normal)
            } else if (i == 3) {
                button.setTitle(newArray[currentQuestion].wrong3, for: .normal)
            } else {
                button.setTitle(newArray[currentQuestion].wrong4, for: .normal)
            }
            
        }
        
        print("current question is: \(currentQuestion)")
        newArray.remove(at: (currentQuestion))
        
        currentQuestion = randomNum()
        print(newArray.count)
        
    }
    
    
    //Button
    @IBAction func btnPressed(_ sender: UIButton) {
        
        if sender.tag == Int(rightAnswerPlacement) {
            
            print("RIGHT")
            points += 1
            accuracy = true
            sender.backgroundColor = UIColor(red: 192/255, green: 216/255, blue: 155/255, alpha: 0.5)
            
        } else {
            print("WRONG!!!!!!")
            accuracy = false
            sender.backgroundColor = UIColor(red: 255/255, green: 99/255, blue: 71/255, alpha: 0.6)
        }
        
        
        
        
        if (questionsSeen <= (questionsAllowed - 1)) {
            
            let when = DispatchTime.now() + 0.45 // change to to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.newQuestion()
                self.backgroundColorNormal()
            }
            
            
            
        } else {
            //when users have seen all questions
            performSegue(withIdentifier: "showScore", sender: self)
        }
     

        
    }
    
    
    
    func backgroundColorNormal() {
        btn1.backgroundColor = UIColor(red:134/255, green:223/255, blue: 121/255, alpha: 0)
        btn2.backgroundColor = UIColor(red:134/255, green:223/255, blue: 121/255, alpha: 0)
        btn3.backgroundColor = UIColor(red:134/255, green:223/255, blue: 121/255, alpha: 0)
        btn4.backgroundColor = UIColor(red:134/255, green:223/255, blue: 121/255, alpha: 0)
        
    }

    
}



func randomNum() -> Int {
    let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: newArray.count)
    
    return randomNumber
    
    //Creates a random number to call from entree array
}




