//
//  TryAgainScreen.swift
//  FinishTheLyricsEdSheeran
//
//  Created by Mel and Sand on 2017-06-18.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import UIKit
import GameKit
import StoreKit


    //Default Values for questionsAllowed and levelChosen?

class TryAgainScreen: UIViewController {
    
    @IBOutlet weak var factLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameDefualtSettings()
        
        factLbl.text = factArray[randomNumFact()]
        
        if gamesPlayed == 1 {
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
            } else {
                // Fallback on earlier versions
            }
        }
    }


    @IBAction func difficultyToggle2(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            levelChosen = true
        }
        
        if sender.selectedSegmentIndex == 1 {
            levelChosen = false
        }
    }
    
    @IBAction func numberQuestionsToggle2(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            questionsAllowed = 10
        } else if sender.selectedSegmentIndex == 1 {
            questionsAllowed = 15
        } else if sender.selectedSegmentIndex == 2 {
            questionsAllowed = 20
        } else if sender.selectedSegmentIndex == 3 {
            questionsAllowed = 25
        }
        
    }
    
    @IBAction func startBtnPressed(_ sender: Any) {
        gamesPlayed += 1
        print("You have played \(gamesPlayed) games.")
        
        
        ////IMPLEMENT REWARD VIDEO HERE
    }
    

    func gameDefualtSettings() {
        levelChosen = true
        questionsAllowed = 15
    }
    
    func randomNumFact() -> Int {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: factArray.count)
        
        return randomNumber
        
        //Creates a random number to call from factArray
    }
    
}
