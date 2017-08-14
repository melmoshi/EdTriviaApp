//
//  Question.swift
//  FinishTheLyricsEdSheeran
//
//  Created by Mel and Sand on 2017-06-14.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import Foundation

class Question {
    
    fileprivate var _question: String!
    fileprivate var _answer: String!
    fileprivate var _wrong1: String!
    fileprivate var _wrong2: String!
    fileprivate var _wrong3: String!
    fileprivate var _wrong4: String!
    
    var question: String {
        return _question
    }
    
    var answer: String {
        return _answer
    }
    
    var wrong1: String {
        return _wrong1
    }
    
    var wrong2: String {
        return _wrong2
    }
    
    var wrong3: String {
        return _wrong3
    }
    
    var wrong4: String {
        return _wrong4
    }
    
    
    init(question: String, answer: String, wrong1: String, wrong2: String, wrong3: String, wrong4: String) {
        self._question = question
        self._answer = answer
        self._wrong1 = wrong1
        self._wrong2 = wrong2
        self._wrong3 = wrong3
        self._wrong4 = wrong4
    }
    
}

var questions = [Question]()
var newArray = [Question]()



    //Add items from CSV to an array (of Class Question)
func parseCSV (difficulty: String) {
    
    let path = Bundle.main.path(forResource: difficulty, ofType: "csv")!
    
    do {
        
        let csv = try CSV(contentsOfURL: path)
        let rows = csv.rows
        print(rows)
        
        
        for row in rows {
            
            let question = row["Question"]!
            let answer = row["Answer"]!
            let wrong1 = row["Wrong1"]!
            let wrong2 = row["Wrong2"]!
            let wrong3 = row["Wrong3"]!
            let wrong4 = row["Wrong4"]!
            
            let pack = Question(question: question, answer: answer, wrong1: wrong1, wrong2: wrong2, wrong3: wrong3, wrong4: wrong4)
            
            
            questions.append(pack)
        }
        
    } catch let err as NSError {
        print(err.debugDescription)
    }
    
}

        //Replace "=" with commas in the array we made with parseCSV()
    func updateArray () {
        
    for x in 0...(questions.count - 1) {
        let newQuestion = (questions[x].question).replacingOccurrences(of: "=", with: ",")
        let newAnswer = (questions[x].answer).replacingOccurrences(of: "=", with: ",")
        let newWrong1 = (questions[x].wrong1).replacingOccurrences(of: "=", with: ",")
        let newWrong2 = (questions[x].wrong2).replacingOccurrences(of: "=", with: ",")
        let newWrong3 = (questions[x].wrong3).replacingOccurrences(of: "=", with: ",")
        let newWrong4 = (questions[x].wrong4).replacingOccurrences(of: "=", with: ",")
        
        let newPack = Question(question: newQuestion, answer: newAnswer, wrong1: newWrong1, wrong2: newWrong2, wrong3: newWrong3, wrong4: newWrong4)
        
        
        newArray.append(newPack)
    
     }
        
}



