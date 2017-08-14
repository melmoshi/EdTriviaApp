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
    
    @IBOutlet weak var answerBtn1: AnswerButton!
        //  //  //Review notes.. Does this do anything???
    
    
    @IBOutlet weak var questionLbl: UILabel!
        //Question Label
    
    
    @IBOutlet weak var chapterLbl: UILabel!
        //Label that declares what question you're on (1/10)
    
    var currentQuestion = 1
        //current question in the array 
    
    var rightAnswerPlacement = 0
        //where the right answer is in the array
    
    var questionsSeen = 0
        //counts number of questions seen
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        points = 0
        
        if levelChosen == "Easy" {
            parseCSV(difficulty: "EasyLyrics")
        } else {
            parseCSV(difficulty: "HardLyrics")
        }
        
        updateArray()
            //replaces "=" with commas in the array
        
        newQuestion()
        
        chapterLbl.text = "\(questionsSeen)/\(questionsAllowed)"
    }
    
    
    //Function that displays new question
    func newQuestion() {
        
        questionLbl.text = newArray[currentQuestion].question
        
        questionsSeen += 1
        
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
            
        } else {
            print("WRONG!!!!!!")
        }
        
        if (questionsSeen <= (questionsAllowed - 1)) {
            newQuestion()
        } else {
            //when users have seen all questions
            performSegue(withIdentifier: "showScore", sender: self)
        }
     
        chapterLbl.text = "\(questionsSeen) / \(questionsAllowed)"
        
    }
    
}



func randomNum() -> Int {
    let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: newArray.count)
    
    return randomNumber
    
    //Creates a random number to call from entree array
}


